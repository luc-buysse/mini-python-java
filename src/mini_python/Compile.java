package mini_python;

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
      visit(d);
    }

    // Generate code for the preimplanted function
    implementPrint();
    implementRange();
    implementLen();
    implementList();
  }

  private void implementLen() {
    result.label("len");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");
    // gerer les arguments
    TODO

    // Allocate space for local variables
    TODO

    // Generate code for the body of the function
    TODO

    // Restore the stack pointer and return
    result.popq("%rbp");
    result.ret();
  }

  private void implementList() {
    result.label("list");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");
    // gerer les arguments
    TODO

    // Allocate space for local variables
    TODO

    // Generate code for the body of the function
    TODO
    // Restore the stack pointer and return
    result.popq("%rbp");
    result.ret();
  }

  private void implementRange() {
    result.label("range");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");
    // gerer les arguments
    TODO

    // Allocate space for local variables
    TODO

    // Generate code for the body of the function
    TODO

    // Restore the stack pointer and return
    result.popq("%rbp");
    result.ret();
  }

  private void implementPrint() {
    result.label("print");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");
    // gerer les arguments
    TODO

    // Allocate space for local variables
    TODO

    // Generate code for the body of the function
    TODO

    // Restore the stack pointer and return
    result.popq("%rbp");
    result.ret();
  }

  public void visit(TDef d) {
    result.label(d.f.name);
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");
    // gerer les arguments
    TODO

    // Allocate space for local variables
    TODO

    // Generate code for the body of the function
    d.body.accept(this);

    // Restore the stack pointer and return
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

  }
  public void visit(TSassign s) {

  }
  public void visit(TSprint s) {

  }
  public void visit(TSblock s) {

  }
  public void visit(TSfor s) {

  }
  public void visit(TSeval s) {

  }
  public void visit(TSset s) {

  }
  public void visit(TDef d) {

  }
}
