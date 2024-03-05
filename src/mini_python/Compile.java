package mini_python;

import java.util.*;


class Compile {

  static boolean debug = false;

  static X86_64 file(TFile f) {
    MyTVisitor visitor = new MyTVisitor();
    visitor.visit(f);

    // Generate X86_64 output based on the visitor's result
    X86_64 output = visitor.getResult();
    return output;
  }
}

class MyTVisitor implements TVisitor {
  private X86_64 result;
  final String[] registers = new String[]{"%rdi", "%rsi", "%rdx", "%rcx", "%r8", "%r9", "%rbx", "%r10", "%r11", "%r12", "r13", "r14", "r15", "%rax"};
  HashMap<String, Integer> globalVar = new HashMap<String, Integer>();

  Function currentFunction;
  Constant cst;
  Variable var;

  public MyTVisitor() {
    super();
    result = new X86_64();

    if (Compile.debug)
      System.out.println("\n**\ncompilation start\n**");
  }

  public X86_64 getResult() {
    return result;
  }

  public void visit(TFile f) {
    // Generate code for the main body
    for (TDef d : f.l) {
      if (d.f.name.equals("main")) {
        if (Compile.debug && d.f.params.size() != 0)
            System.out.println("Error: main function should not have any parameters");
        currentFunction = d.f;
        visit(d);
        break;
      }
    }

    // Generate code for each function
    for (TDef d : f.l) {
      if (!d.f.name.equals("len") 
        && !d.f.name.equals("range") 
        && !d.f.name.equals("list") 
        && !d.f.name.equals("my_malloc") // preimplanted functions
        && !d.f.name.equals("main")) // main function
        visit(d);
    }

    // Generate code for the preimplanted function
    implementPrint();
    implementRange();
    implementLen();
    implementList();
    implementMalloc();

    // Generate data for const 
    result.dlabel(".None");
    result.quad(0);
    result.quad(0);
  }

  public void visit(TDef d) {
    if (Compile.debug){
      System.out.println("Compiling " + d.f.name);
    }

    currentFunction = d.f;

    // Initialize stack frame
    result.label(d.f.name +"_"+ d.f.uid);
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    // age the registers
    currentFunction.age = 1;
    for (String r : registers) {
      d.f.reg_age.put(r, 0);
    }

    // compteurs de variables locales et de variables temporaires
    currentFunction.fixe_stack_size = 1;
    currentFunction.tmp = 0;

    // args
    int i = 0;
    for (Variable v : d.f.params) {
      if (i < 6) {
        v.str = -currentFunction.fixe_stack_size*8 + "(%rbp)";
        currentFunction.fixe_stack_size++;
        d.f.memory.put(registers[i], v);
        d.f.reg_age.put(registers[i], currentFunction.age);
      } else {
        v.str = (i-6+3)*8+"(%rbp)"; // 6 pour les 6 premiers args, 3 pour les rbp, rip et global array pointer dans la stack
      }
      i++;
    }

    if (Compile.debug) {
      System.out.println("currentFunction.fixe_stack_size apres assigment des params : " + currentFunction.fixe_stack_size);
    }

    // allocate space for local variables
    for (Variable v : d.f.variables.values()) {
      if (v.str.equals("")) {
        v.str = -currentFunction.fixe_stack_size*8+"(%rbp)";
        currentFunction.fixe_stack_size++;
      }
    }

    if (Compile.debug) {
      System.out.println("currentFunction.fixe_stack_size apres assigment des variables locales : " + currentFunction.fixe_stack_size);
    }

    // space for the calle saved registers
    int n = 1/* %rax */ + ((d.f.params.size()>6)?6:d.f.params.size())/* args reg */;
    for (int j = n; j < this.registers.length; j++) {
      Variable v = Variable.mkVariable(registers[j]);
      d.f.variables.put(registers[j],v);
      v.str = -currentFunction.fixe_stack_size*8+"(%rbp)";
      d.f.memory.put(registers[j], v);
      currentFunction.fixe_stack_size++;
    }

    if (Compile.debug) {
      System.out.println("currentFunction.fixe_stack_size apres assigment des calle saved registres : " + currentFunction.fixe_stack_size);
    }

    // update the stack pointer
    result.subq("$"+currentFunction.fixe_stack_size*8, "%rsp");

    d.body.accept(this);

    // restore the calle saved registers
    this.restoreCalleSavedRegisters(d.f);

    // Restore the stack pointer and return*
    result.movq("%rbp", "%rsp");
    result.popq("%rbp");
    result.ret();
  }

  public void visit(Cnone c) {
    String reg = getReg(var);
    result.movq(".None", reg);
  }
  public void visit(Cbool c) {
    // clean the reg
    freeReg("%rax");
    freeReg("%rdi");

    // Set up args
    result.movq("$16", "%rdi");

    // allocate memory for the boolean
    result.call("my_malloc");

    // Set up the var as boolean
    result.movq(1, "(%rax)");
    result.movq( c.b ? 1:0, "4(%rax)");

    // update memory state
    currentFunction.memory.put("%rax", var);
    currentFunction.memory.remove("%rdi");
    currentFunction.reg_age.put("%rax", currentFunction.age++);
    currentFunction.reg_age.put("%rdi", -1);

  }
  public void visit(Cstring c) {
    // free needed reg
    // TODO

    result.movq(c.s.length(), "%rsi");// get the length of the string to construct
    result.leaq("17(,%rsi,1)", "%rdi");// get the length of the memory to allocate 17 = 2*8 + 1

    result.call("my_malloc");// allocate memory for the list

    result.movq(3, "(%rax)");// store the type of the list
    result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory

    String loopLabel = currentFunction.toString()+currentFunction.tmp++;
    result.label(loopLabel);
    result.decq("%rsi");// decrement the length of the list
    result.movq("%rsi", "16(%rax,%rsi,1)");// store the elements of the list to the allocated memory
    result.testq("%rsi", "%rsi");
    result.jge(loopLabel); // Jump to "list_loop" if %rsi is greater than or equal to zero

    // update memory state
    // TODO
  }
  public void visit(Cint c) {
    // TODO
  }
  public void visit(TEcst e)  {
    e.c.accept(this);
  }
  public void visit(TEbinop e)  {
    // TODO
  }
  public void visit(TEunop e) {
    // TODO
  }
  public void visit(TEident e) {
    // TODO
  }
  public void visit(TEcall e) {
    // TODO
  }
  public void visit(TEget e) {
    // TODO
  }
  public void visit(TElist e) {
    // TODO
  }
  public void visit(TErange e) {
    // TODO
  }
  public void visit(TSif s) {
    // TODO
  }
  public void visit(TSreturn s) {
    s.e.accept(this);
    
    // restore the calle saved registers
    restoreCalleSavedRegisters(currentFunction);

    // Restore the stack pointer and return*
    result.movq("%rbp", "%rsp");
    result.popq("%rbp");
    result.ret();;
  }
  public void visit(TSassign s) {
    // TODO
  }
  public void visit(TSprint s) {
    result.call("print");
  }
  public void visit(TSblock s) {
    // TODO
  }
  public void visit(TSfor s) {
    // TODO
  }
  public void visit(TSeval s) {
    // TODO
  }
  public void visit(TSset s) {
    // TODO
  }

  private Variable createTmp() {
    Variable v = Variable.mkVariable("#" + currentFunction.tmp);
    currentFunction.tmp++;
    currentFunction.variables.put(v.name, v);
    v.str = -(currentFunction.fixe_stack_size + currentFunction.tmp++)*8+"(%rbp)";
    result.subq("$8", "%rsp");

    if (Compile.debug)
      System.out.println("creating tmp " + v.name + " in " + currentFunction.name);

    return v;
  }

  private void killTmp(Variable v) {
    if (Compile.debug)
      System.out.println("killing var " + v.name + " in " + currentFunction.name);

    if (v.name.charAt(0) == '#' && currentFunction.memory.containsValue(v))
    {
      String reg = currentFunction.memory.entrySet().stream().filter(entry -> entry.getValue().equals(v)).findFirst().get().getKey();
      currentFunction.memory.remove(reg);
      currentFunction.reg_age.put(reg, -1);
      // TODO : free the allocated memory for the variable ?
    }
    else
    {
      if (Compile.debug)
        System.out.println("ERROR: trying to kill a non temporary variable : " + v.name);
    }
  }

  private void loadVar(Variable v, String reg) {
    // load the variable in the register and erase the previous variable in the register
    if (currentFunction.variables.containsValue(v)) 
    {// local variable
      result.movq(v.str, reg);
      if (Compile.debug)
        System.out.println("loading local " + v.name + " in " + reg);
    }
    else
    {// global variable
      if (Compile.debug)
        System.out.println("loading global " + v.name + " in " + reg);
      result.pushq("%rbp");
      result.movq("-8(%rbp)", "%rbp");
      result.movq(v.str, reg);
      result.popq("%rbp");
    }
    // update the memory
    currentFunction.memory.put(reg, v);
  }

  private void freeReg(String reg) {
    // free the reg by saving the variable in the stack
    if (Compile.debug)
      System.out.println("freeing " + reg);

    Variable v = currentFunction.memory.get(reg);
    if (currentFunction.reg_age.get(reg) == -1 ){
      if (Compile.debug)
        System.out.println("Warning: trying to free an empty register");

      return;
    }
    if (currentFunction.variables.containsValue(v))
    {// local variable
      result.movq(reg, v.str);
    }
    else
    {// global variable
      result.pushq("%rbp");
      result.movq("-8(%rbp)", "%rbp");
      result.movq(reg, v.str);
      result.popq("%rbp");
    }
    // update the memory
    currentFunction.memory.remove(reg);

    if (Compile.debug)
      System.out.println(v.name + " evicted from " + reg);
  }

  private String getReg(Variable v) {
    if (currentFunction.memory.containsValue(v)) { // no eviction
      if (Compile.debug)
        System.out.println("acces to " + v.name + " without stack access");

      // get the register
      String reg = currentFunction.memory.entrySet().stream().filter(entry -> entry.getValue().equals(v)).findFirst().get().getKey();

      // age the registers
      currentFunction.reg_age.put(reg, currentFunction.age++);

      return reg;
    } else {//eviction
      // get the oldest register
      String oldest = currentFunction.reg_age.entrySet().stream().min(Comparator.comparingInt(Map.Entry::getValue)).get().getKey();
      currentFunction.used_reg.add(oldest);

      if (Compile.debug)
        System.out.println("acces to " + v.name + " with stack access, now buffered in " + oldest);

      // update the register and memory state
      freeReg(oldest);
      loadVar(v, oldest);

      // age the registers
      currentFunction.reg_age.put(oldest, currentFunction.age++);

      return oldest;
      }
  }

  private void restoreCalleSavedRegisters(Function f) {
    for (Variable v : f.variables.values()) {
      if (v.name.charAt(0) == '%' && f.used_reg.contains(v.name)){
        if (Compile.debug) {
          System.out.println("restoring " + v.name);
        }
        result.movq(v.str, v.name);
      }
    }
    // TODO : free the allocated memory for the local variables
  }

  private void implementMalloc() {
    result.label("my_malloc");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");
    result.andq("$-16", "%rsp");// 16-byte stack alignment

    // caller save used registers TODO
    result.call("malloc");
    result.movq("%rbp", "%rsp");
    result.popq("%rbp");
    result.ret();
    
  }

  private void implementLen() {
    result.label("len");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    // calle save used registers
    result.pushq("%rsi");
    result.movq("8(%rdi)", "%rsi");// get the length of the list

    // Set up args
    result.movq(16, "%rdi");

    // allocate memory for len of the list
    result.call("my_malloc");

    // set up return value
    result.movq(2, "(%rax)");
    result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory

    // calle restore used registers
    result.popq("%rsi");

    // Restore the stack pointer and return
    result.popq("%rbp");
    result.ret();
  }

  private void implementList() {
    result.label("list");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    // calle save used registers
    result.pushq("%rsi");

    // Generate code for the body of the function
    result.movq("8(%rdi)", "%rsi");// get the length of the list to construct
    result.leaq("16(,%rsi,8)", "%rdi");// get the length of the memory to allocate

    result.call("my_malloc");// allocate memory for the list

    result.movq(4, "(%rax)");// store the type of the list
    result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory

    result.testq("%rsi", "%rsi");
    result.jle("list_skip");// if %rsi <=0, nothing need to be done

    result.label("list_loop");
    result.decq("%rsi");// decrement the length of the list
    result.movq("%rsi", "16(%rax,%rsi,8)");// store the elements of the list to the allocated memory
    result.testq("%rsi", "%rsi");
    result.jg("list_loop"); // Jump to "list_loop" if %rsi is greater than zero

    result.label("list_skip");

    // calle restore used registers
    result.popq("%rsi");

    // Restore the stack pointer and return
    result.popq("%rbp");
    result.ret();
  }

  private void implementRange() {
    result.label("range");
    result.ret();// list does everything
  }

  private void implementPrint() {
    result.label("print");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");
    result.subq("$8", "%rsp");

    // Generate code for the body of the function
    // TODO
    // faire différents cas en fonction du type en entrée

    // Restore the stack pointer and return
    result.addq("$8", "%rsp");
    result.popq("%rbp");
    result.ret();
  }

}
