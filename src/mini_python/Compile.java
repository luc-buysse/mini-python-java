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
  final String[] registers = new String[]{"%rdi", "%rsi", "%rdx", "%rcx", "%r8", "%r9", "%rax", "%rbx", "%r10", "%r11", "%r12", "r13", "r14", "r15"};
  Function currentFunction;

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

    // compteur de variables locales
    int cpt = 1;

    // args
    int i = 0;
    for (Variable v : d.f.params) {
      if (i < 6) {
        v.str = -cpt*8+"(%rbp)";
        cpt++;
        d.f.memory.put(registers[i], v);
        d.f.reg_age.put(registers[i], 0);
      } else {
        v.str = (i-6+2)*8+"(%rbp)"; // 6 pour les 6 premiers args, 2 pour les 2 rbp et rip dans la stack
      }
      i++;
    }

    if (Compile.debug) {
      System.out.println("cpt apres assigment des params : " + cpt);
    }

    // allocate space for local variables
    for (Variable v : d.f.variables) {
      if (!v.str.equals("")) {
        v.str = -cpt*8+"(%rbp)";
        cpt++;
      }
    }

    if (Compile.debug) {
      System.out.println("cpt apres assigment des variables locales : " + cpt);
    }

    // space for the calle saved registers
    int n = 1/* %rax */ + ((d.f.params.size()>6)?6:d.f.params.size())/* args reg */;
    for (int j = n; j < this.registers.length; j++) {
      Variable v = Variable.mkVariable(registers[j]);
      d.f.variables.add(v);
      v.str = -cpt*8+"(%rbp)";
      d.f.memory.put(registers[j], v);
      cpt++;
    }

    // update the stack pointer
    result.subq("$"+cpt*8, "%rsp");

    d.body.accept(this);

    // restore the calle saved registers
    this.restoreCalleSavedRegisters(d.f);

    // Restore the stack pointer and return*
    result.movq("%rbp", "%rsp");
    result.popq("%rbp");
    result.ret();
  }

  public void visit(Cnone c) {

  }
  public void visit(Cbool c) {

  }
  public void visit(Cstring c) {

  }
  public void visit(Cint c) {

  }
  public void visit(TEcst e)  {

  }
  public void visit(TEbinop e)  {

  }
  public void visit(TEunop e) {

  }
  public void visit(TEident e) {

  }
  public void visit(TEcall e) {

  }
  public void visit(TEget e) {

  }
  public void visit(TElist e) {

  }
  public void visit(TErange e) {

  }
  public void visit(TSif s) {

  }
  public void visit(TSreturn s) {
    s.e.accept(this);
    
    // restore the calle saved registers
    this.restoreCalleSavedRegisters(currentFunction);

    // Restore the stack pointer and return*
    result.movq("%rbp", "%rsp");
    result.popq("%rbp");
    result.ret();;
  }
  public void visit(TSassign s) {

  }
  public void visit(TSprint s) {
    result.call("print");
  }
  public void visit(TSblock s) {

  }
  public void visit(TSfor s) {

  }
  public void visit(TSeval s) {

  }
  public void visit(TSset s) {

  }

  private void restoreCalleSavedRegisters(Function f) {
    for (Variable v : f.variables) {
      if (v.name.charAt(0) == '%') {
        result.movq(v.str, v.name);
      }
    }
  }

  private void implementMalloc() {
    result.label("my_malloc");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");
    result.andq("$-16", "%rsp");// 16-byte stack alignment

    // calle save used registers TODO
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

    // Generate code for the body of the function
    result.movq("8(%rdi)", "%rsi");// get the length of the list
    result.movq("$16", "%rdi");

    result.call("my_malloc");// allocate memory for len of the list

    result.movq("$2", "(%rax)");
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
    result.leaq("16(%rsi)", "%rdi");// get the length of the memory to allocate

    result.call("my_malloc");// allocate memory for the list

    result.movq("$4", "(%rax)");// store the type of the list
    result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory

    result.label("list_loop");
    result.decq("%rsi");// decrement the length of the list
    result.movq("%rsi", "8(%rax,%rsi,8)");// store the elements of the list to the allocated memory
    result.testq("%rsi", "%rsi");
    result.jge("list_loop"); // Jump to "list_loop" if %rsi is greater than or equal to zero

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
