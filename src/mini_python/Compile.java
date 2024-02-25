package mini_python;

import java.sql.Array;
import java.util.*;
import java.util.function.ToDoubleBiFunction;

class Context {
  public String functionName;
  public HashMap<String, String> var_map = new HashMap<String,String>();
  public Context parent;
  public String[] work_register;
  private int work_register_index;
  private int max_used_register;

  Context(String functionName, Context parent) {
    this.functionName = functionName;
    this.parent = parent;
    this.work_register_index = 0;
    this.max_used_register = -1;
  }

  public int geWorkRegister() {
    if (work_register_index < work_register.length) {
      if (work_register_index > max_used_register) {
        max_used_register = work_register_index;
      }
      work_register_index = work_register_index + 1;
      return work_register_index - 1;
    } else {
      return -1;
    }
  }

  public void freeWorkRegister() {
    if (work_register_index > 0) {
      work_register_index = work_register_index - 1;
    }
    else {
      throw new Error("No register to free");
    }
  }
}


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
  private Context rootContext = new Context("main", null);
  private Context context;

  public MyTVisitor() {
    result = new X86_64();
  }

  public X86_64 getResult() {
    return result;
  }

  public void visit(TFile f) {
    // Generate code for the main body
    for (TDef d : f.l) {
      if (d.f.name.equals("main")) {
        visit(d);
      }
    }

    // Generate code for each function
    for (TDef d : f.l) {
      if (Compile.debug)
        System.out.println("Compiling " + d.f.name);
      if (!d.f.name.equals("len") 
        && !d.f.name.equals("range") 
        && !d.f.name.equals("print") 
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
    // Allocate space for local variables
    if (Compile.debug)
      System.out.println("Allocating space for local variables");

    if (d.f.name.equals("main")){
      context = rootContext;
    } else {
      context = new Context(d.f.name, rootContext);
    }

    // Sort the variables by use
    LinkedHashMap<String, Integer> sortedMap = d.f.env.variables.entrySet()
      .stream()
      .sorted(d.f.env.variables.Entry.comparingByValue())
      .collect(
          java.util.stream.Collectors.toMap(
              d.f.env.variables.Entry::getKey, 
              d.f.env.variables.Entry::getValue, 
              (oldValue, newValue) -> oldValue, LinkedHashMap::new
          )
      );// a refaire
    Iterator<String> keyIterator = sortedMap.keySet().iterator();

    // %rax is the return value
    String[] registers = new String[]{"%rdi", "%rsi", "%rdx", "%rcx", "%r8", "%r9","%rbx", "%r10", "%r11", "%r12", "r13", "r14", "r15"};

    // caller saved registers
    int used_registers = 0;
    while (keyIterator.hasNext() && used_registers < 13) {
      String key = keyIterator.next();
      context.var_map.put(key, registers[used_registers]);
      used_registers = used_registers + 1;
    }

    // stack
    int stack_offset = 1;
    while (keyIterator.hasNext()) {
      String key = keyIterator.next();
      if (d.f.params.contains(key) && d.f.params.indexOf(key) >= 6){
        context.var_map.put(key, "-" + (d.f.params.indexOf(key) - 6 + 2)); // 6 is the number of register used for the arguments and 2 is the offset for the return address and the saved base pointer
      } else {
        context.var_map.put(key, stack_offset + "");
        stack_offset = stack_offset + 1;
      }
    }

    context.work_register = new String[registers.length - used_registers];
    for (int i = 0; i < context.work_register.length; i++) {
      context.work_register[i] = registers[used_registers + i];
    }

    if (Compile.debug)
      System.out.println("Allocation: " + context.var_map);

    // handle initialisation of the memories (args and globals)
    int nb_args = d.f.params.size();
    int nb_locals = d.f.env.variables.size();
    // comment savoir si on a des variables globales ?

    // Generate code
    result.label(d.f.name);
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    d.body.accept(this);

    // restore the calle saved registers


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


  private void implementMalloc() {
    result.label("my_malloc");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");
    result.andq("$-16", "%rsp");// 16-byte stack alignment
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
    TODO ;
    // faire différents cas en fonction du type en entrée

    // Restore the stack pointer and return
    result.addq("$8", "%rsp");
    result.popq("%rbp");
    result.ret();
  }

}
