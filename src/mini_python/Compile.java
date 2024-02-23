package mini_python;

import java.util.LinkedHashMap;

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

  public MyTVisitor() {
    result = new X86_64();
  }

  public X86_64 getResult() {
    return result;
  }

  public void visit(TFile f) {
    // Generate code for each function
    for (TDef d : f.l) {
      if (Compile.debug)
        System.out.println("Compiling " + d.f.name);
      if (!d.f.name.equals("len") 
        && !d.f.name.equals("range") 
        && !d.f.name.equals("print") 
        && !d.f.name.equals("list") 
        && !d.f.name.equals("my_malloc")) // preimplanted functions
        visit(d);
    }

    // Generate code for the preimplanted function
    implementPrint();
    implementRange();
    implementLen();
    implementList();
    implementMalloc();

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

    result.movq("8(%rdi)", "%rsi");// get the length of the list
    result.movq("$16", "%rdi");
    result.pushq("%rsi");// save the length of the list
    result.call("my_malloc");// allocate memory for len of the list
    result.popq("%rsi");// restore the length of the list
    result.movq("$2", "(%rax)");
    result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory

    // Restore the stack pointer and return
    result.popq("%rbp");
    result.ret();
  }

  private void implementList() {
    result.label("list");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    // Generate code for the body of the function
    result.movq("8(%rdi)", "%rsi");// get the length of the list to construct
    result.leaq("16(%rsi)", "%rdi");// get the length of the memory to allocate
    result.pushq("%rsi");// save the length of the list

    result.call("my_malloc");// allocate memory for the list

    result.popq("%rsi");// restore the length of the list
    result.movq("$4", "(%rax)");// store the type of the list
    result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory

    result.label("list_loop");
    result.decq("%rsi");// decrement the length of the list
    result.movq("%rsi", "8(%rax,%rsi,8)");// store the elements of the list to the allocated memory
    result.testq("%rsi", "%rsi");
    result.jge("list_loop"); // Jump to "list_loop" if %rsi is greater than or equal to zero

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

  public void visit(TDef d) {
    result.label(d.f.name);
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    // Allocate space for local variables
    LinkedHashMap<String, Integer> sortedMap = d.f.env.variables.entrySet()
      .stream()
      .sorted(d.f.env.variables.Entry.comparingByValue())
      .collect(
          java.util.stream.Collectors.toMap(
              d.f.env.variables.Entry::getKey, 
              d.f.env.variables.Entry::getValue, 
              (oldValue, newValue) -> oldValue, LinkedHashMap::new
          )
      );
    Iterator<String> keyIterator = sortedMap.keySet().iterator();

    HashMap<String, String> allocation = new HashMap<String, String>();

    // caller saved registers
    while (keyIterator.hasNext()) {
      String key = keyIterator.next();
      TODO
    }

    // stack
    while (keyIterator.hasNext()) {
      String key = keyIterator.next();
      TODO
    }

    // gerer les arguments
    TODO

    // Generate code for the body of the function
    d.body.accept(this);

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
}
