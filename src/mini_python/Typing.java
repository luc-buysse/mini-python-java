package mini_python;

import java.util.*;


class Environment {
  public String functionName;
  public Set<String> variables = new HashSet<String>();
  public Environment parent;

  Environment(String functionName, Environment parent) {
    this.functionName = functionName;
    this.parent = parent;
  }
}

class FEnvironment {
  public Map<String, Function> functions = new HashMap<String, Function>();

  FEnvironment() {}
}

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
  Environment rootEnv = new Environment("main", null);
  Environment env;

  FEnvironment fenv = new FEnvironment();

  Constant cst;
  TExpr expr;
  TStmt stmt;
  TDef def;
  TFile file;

  MyVisitor() {
    super();
    this.env = rootEnv;

    // ****** Add basic functions to the function environment

    // len(list)
    LinkedList<Variable> l = new LinkedList<Variable>();
    l.add(Variable.mkVariable("list"));
    fenv.functions.put("len", new Function("len", l));
    
    // list(range)
    l = new LinkedList<Variable>();
    l.add(Variable.mkVariable("range"));
    fenv.functions.put("list", new Function("list", l));

    // range(n)
    l = new LinkedList<Variable>();
    l.add(Variable.mkVariable("n"));
    fenv.functions.put("range", new Function("range", l));
  }

  public TFile visit(File f) {
    TFile file = new TFile();
    for(Def d : f.l) {
      file.l.add(visit(d));
    }
    f.s.accept(this);
    file.l.add(new TDef(new Function("main", new LinkedList<Variable>()), stmt));

    return file;
  }

  public TDef visit(Def d) {
    env = new Environment(d.f.id, env);

    // Check for unique function name
    if(fenv.functions.containsKey(d.f.id)) {
      Typing.error(d.f.loc, "duplicate function " + d.f.id);
    }

    // Check parameters and add them to the environment
    LinkedList<Variable> variables = new LinkedList<Variable>();
    for(Ident i : d.l) {
      if(env.variables.contains(i.id)) {
        Typing.error(i.loc, "duplicate parameter " + i.id);
      }
      env.variables.add(i.id);
      variables.add(Variable.mkVariable(i.id));
    }

    // Add the function to the function environment
    Function f = new Function(d.f.id, variables);
    fenv.functions.put(d.f.id, f);

    // Check the body
    d.s.accept(this);

    // Restore the environment
    env = env.parent;

    // Build the output
    return new TDef(f, stmt);
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
    Environment ie = env;
    while (ie != null) {
      if (ie.variables.contains(e.x.id)) {
        expr = new TEident(Variable.mkVariable(e.x.id));
        return;
      }
      ie = ie.parent;
    }

    Typing.error(e.x.loc, "undefined variable " + e.x.id);
  }

  public void visit(Ecall e) {
    try {
      // Check the number of arguments
      Function f = fenv.functions.get(e.f.id);
      if(e.l.size() != f.params.size()) {
        Typing.error(e.f.loc, "wrong number of arguments for function " + e.f.id);
      }
      
      // Evaluate the arguments
      LinkedList<TExpr> l = new LinkedList<TExpr>();
      for (Expr e1 : e.l) {
        e1.accept(this);
        l.add(expr);
      }
      
      // Build the output
      expr = new TEcall(f, l);

    } catch (Exception me) {
      // Function undefined
      Typing.error(e.f.loc, "undefined function " + e.f.id);
    }
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
    
    Variable v = Variable.mkVariable(s.x.id);
    env.variables.add(v.name);
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
    s.s.accept(this);
    stmt = new TSfor(Variable.mkVariable(s.x.id), e, stmt);
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

