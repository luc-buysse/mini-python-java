package mini_python;

import java.util.*;


class Typing {

  static boolean debug = false;

  // use this method to signal typing errors
  static void error(Location loc, String msg) {
    throw new Error(loc + "\nerror: " + msg);
  }

  static TFile file(File f) {
    MyVisitor v = new MyVisitor();
    return v.visit(f);
  }
}

class MyVisitor implements Visitor {
  Function mainFunction = new Function("main", null);
  Function currentFunction;

  Constant cst;
  TExpr expr;
  TStmt stmt;
  TDef def;
  TFile file;

  boolean isList;

  MyVisitor() {
    super();
    this.currentFunction = mainFunction;

    // ****** Add basic functions to the function environment

    if (Typing.debug) {
      System.out.println("\n**\ntyping start\n**");
    }
    // len(list)
    LinkedList<Variable> l = new LinkedList<Variable>();
    l.add(Variable.mkVariable("list"));
    mainFunction.functions.add(new Function("len", l, mainFunction));
    
    // list(range)
    l = new LinkedList<Variable>();
    l.add(Variable.mkVariable("range"));
    mainFunction.functions.add(new Function("list", l, mainFunction));

    // range(n)
    l = new LinkedList<Variable>();
    l.add(Variable.mkVariable("n"));
    mainFunction.functions.add(new Function("range", l, mainFunction));

    this.isList = false;
  }

  public TFile visit(File f) {
    TFile file = new TFile();
    for(Def d : f.l) {
      file.l.add(visit(d));
    }
    f.s.accept(this);
    file.l.add(new TDef(mainFunction, stmt));

    return file;
  }

  public TDef visit(Def d) {
    if (Typing.debug)
      System.out.println("checking definition of function \"" + d.f.id + "\" at " + d.f.loc );

      // Check for unique function name
    if(currentFunction.functions.contains(d.f.id)) {
      Typing.error(d.f.loc, "duplicate function " + d.f.id);
    }
    if(d.f.id.equals("len") || d.f.id.equals("range") || d.f.id.equals("list")) {
      Typing.error(d.f.loc, "function " + d.f.id + " is a preimplanted function");
    }

    // Create a new function environment
    currentFunction = new Function(d.f.id, currentFunction);

    // Check parameters and add them to the environment
    HashSet<String> tmp = new HashSet<String>();
    for(Ident i : d.l) {
      if(tmp.contains(i.id)) {
        Typing.error(i.loc, "duplicate parameter " + i.id);
      }
      tmp.add(i.id);
      Variable v = Variable.mkVariable(i.id);
      currentFunction.variables.add(v);
      currentFunction.params.add(v);
    }

    if (Typing.debug)
      System.out.println("parameters :" + tmp.toString());

    // Check the body
    d.s.accept(this);

    if (Typing.debug)
      System.out.println("function \"" + d.f.id + "\" implementation is well typed");

    // Build the output
    TDef def = new TDef(currentFunction, stmt);

    // Restore the environment
    currentFunction = currentFunction.parent;

    // return the output
    return def;
  }

  public void visit(Cnone c) {
    cst = c;
  }

  public void visit(Cbool c) {
    cst = c;
  }

  public void visit(Cstring c) {
    cst = c;
  }

  public void visit(Cint c) {
    cst = c;
  }

  public void visit(Ecst e) {
    e.c.accept(this);
    expr = new TEcst(cst);
  }

  public void visit(Ebinop e) {
    e.e1.accept(this);
    TExpr e1 = expr;
    e.e2.accept(this);
    expr = new TEbinop(e.op, e1, expr);
  }

  public void visit(Eunop e) {
    e.e.accept(this);
    expr = new TEunop(e.op, expr);
  }

  public void visit(Eident e) {
    Function fun = currentFunction;
    boolean isGlobal = false;
    while (fun != null) {
      if (fun.containsIdent(e.x.id)) {
        // Increment the number of times the variable is used in env (for optimization purposes)
        Variable v = currentFunction.getFromKey(e.x.id);
        expr = new TEident(v);
        if(isGlobal) {
          v.isUsed();
          v.is_global = true;
        }
        return;
      }
      fun = fun.parent;
      isGlobal = true;
    }

    Typing.error(e.x.loc, "undefined variable " + e.x.id);
  }

  public void visit(Ecall e) {
    // Find the function
    Function f = currentFunction;
    Function fun = f.getFunction(e.f.id);

    while (fun == null && f.parent != null) {
      f = f.parent;
      fun = f.getFunction(e.f.id);
    }

    // Function undefined
    if (fun == null) {
      Typing.error(e.f.loc, "undefined function " + e.f.id);
    }

    // Check the number of arguments
    if(e.l.size() != fun.params.size()) {
      Typing.error(e.f.loc, "wrong number of arguments for function " + e.f.id);
    }

    // Check list(range()) usage rules
    if (e.f.id.equals("range") && !this.isList){
      Typing.error(e.f.loc, "range used without list");
    } else if (e.f.id.equals("list")){
      this.isList = true;
      if (!(e.l.getLast() instanceof Ecall) || !((Ecall)e.l.getLast()).f.id.equals("range")) {
        Typing.error(e.f.loc, "list used without range");
      }
    } else {
      this.isList = false;
    }

    // Evaluate the arguments
    LinkedList<TExpr> l = new LinkedList<TExpr>();
    for (Expr e1 : e.l) {
      e1.accept(this);
      l.add(expr);
    }
      
    // Build the output
    expr = new TEcall(fun, l);

  }

  public void visit(Eget e) {
    e.e1.accept(this);
    TExpr e1 = expr;
    e.e2.accept(this);

    expr = new TEget(e1, expr);
  }

  public void visit(Elist e) {
    LinkedList<TExpr> l = new LinkedList<TExpr>();
    for (Expr e1 : e.l) {
      e1.accept(this);
      l.add(expr);
    }
    expr = new TElist(l);
  }

  public void visit(Sif s) {
    s.e.accept(this);
    TExpr e = expr;
    s.s1.accept(this);
    TStmt s1 = stmt;
    s.s2.accept(this);
    stmt = new TSif(e, s1, stmt);
  }

  public void visit(Sreturn s) {
    s.e.accept(this);
    stmt = new TSreturn(expr);
  }

  public void visit(Sassign s) {
    s.e.accept(this);
    TExpr e = expr;
    
    Variable v = currentFunction.getFromKey(s.x.id);

    stmt = new TSassign(v, e);
  }

  public void visit(Sprint s) {
    s.e.accept(this);
    stmt = new TSprint(expr);
  }

  public void visit(Sblock s) {
    LinkedList<TStmt> l = new LinkedList<TStmt>();
    for (Stmt s1 : s.l) {
      s1.accept(this);
      l.add(stmt);
    }
    stmt = new TSblock(l);
  }

  public void visit(Sfor s) {
    s.e.accept(this);
    TExpr e = expr;
    Variable v = currentFunction.getFromKey(s.x.id);
    s.s.accept(this);
    /* create a new variable for the for loop scope if the identifier is not already defined
     * in the current scope else use the existing one 
     */
    stmt = new TSfor(v, e, stmt);
  }

  public void visit(Seval s) {
    s.e.accept(this);
    stmt = new TSeval(expr);
  }

  public void visit(Sset s) {
    s.e1.accept(this);
    TExpr e1 = expr;
    s.e2.accept(this);
    TExpr e2 = expr;
    s.e3.accept(this);
    stmt = new TSset(e1, e2, expr);
  }
}

