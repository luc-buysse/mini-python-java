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
  private StackManagement sM;
  final String[] registers = new String[]{"%rax", "%rdi", "%rsi", "%rdx", "%rcx", "%r8", "%r9", "%r10", "%r11", "%rbx", "%r12", "%r13", "%r14", "%r15"};
  HashMap<String, Integer> globalVar = new HashMap<String, Integer>();

  Function currentFunction;
  Constant cst;
  Variable var;

  public MyTVisitor() {
    super();
    result = new X86_64();
    sM = new StackManagement(result);

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
        result.emit(".global " + d.f.name);
        currentFunction = d.f;
        visit(d);
        break;
      }
    }

    // Generate code for each function
    for (TDef d : f.l) {
      if (!d.f.name.equals("len") 
        && !d.f.name.equals("range") 
        && !d.f.name.equals("list") // preimplanted functions
        && !d.f.name.equals("main")) // main function
        visit(d);
    }

    // Generate code for the preimplanted function
    Implement implement = new Implement(result, currentFunction);
    implement.print();
    implement.range();
    implement.len();
    implement.list();
    implement.malloc();
    implement.strcpy();
    implement.strcat();
    implement.strcmp();
    implement.compare();

    // error gestion code
    implement.errorGestion();

    // Generate data for const 
    result.dlabel("_None");
    result.quad(0);
    result.quad(0);

    if (Compile.debug)
      System.out.println("\n**\ncompilation end\n**");
  }

  public void visit(TDef d) {
    if (Compile.debug){
      System.out.println("Compiling " + d.f.name);
    }

    currentFunction = d.f;

    // Initialize stack frame
    if (d.f.name.equals("main"))
      result.label(d.f.name);
    result.label(d.f.name +"_"+ d.f.uid);
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    // age the registers
    currentFunction.age = 1;
    for (String r : registers) {
      currentFunction.reg_age.put(r, 0);
    }
    currentFunction.reg_age.put("%rax", -1); // %rax is allways caller saved

    // compteurs de variables locales et de variables temporaires
    currentFunction.fixe_stack_size = 0;
    currentFunction.tmp = 0;

    // args
    int i = 0;
    for (Variable v : d.f.params) {

      if (i < 6) {
        v.str = -(++currentFunction.fixe_stack_size)*8 + "(%rbp)";
        d.f.memory.put(registers[i+1], v);// i+1 because %rax in register[0]
        d.f.reg_age.put(registers[i+1], currentFunction.age);
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
        currentFunction.fixe_stack_size++;
        v.str = -currentFunction.fixe_stack_size*8+"(%rbp)";
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
      v.str = -(++currentFunction.fixe_stack_size)*8+"(%rbp)";
      currentFunction.memory.put(registers[j], v);// the reg age is already to 0 meaning is not empty but has never been used by the currentFunction
    }

    if (Compile.debug) {
      System.out.println("currentFunction.fixe_stack_size apres assigment des calle saved registres : " + currentFunction.fixe_stack_size);
      System.out.println("memory state : "+currentFunction.memory.toString());
      System.out.println("registers age : "+currentFunction.reg_age.toString());
    }

    // update the stack pointer
    result.subq("$"+currentFunction.fixe_stack_size*8, "%rsp");

    d.body.accept(this);

    // restore the calle saved registers
    sM.restoreCalleSavedRegisters(d.f);

    // if main, exit
    if (d.f.name.equals("main")) {
      result.xorq("%rdi", "%rdi");
      result.movq(60,"%rax");
      result.emit("syscall");
    }

    // Restore the stack pointer and return*
    result.movq("%rbp", "%rsp");
    result.popq("%rbp");
    result.ret();
  }
  public void visit(Cnone c) {
    String reg = sM.getRegFor(currentFunction, var);
    result.movq("$_None", reg);
  }
  public void visit(Cbool c) {
    // clean the reg
    sM.freeReg(currentFunction, "%rax");
    sM.freeReg(currentFunction, "%rdi");

    // Set up args
    result.movq("$16", "%rdi");

    // allocate memory for the boolean
    result.call("_my_malloc");

    // Set up the var as boolean
    result.movq(1, "(%rax)");
    result.movq( c.b ? 1:0, "8(%rax)");

    // update memory state
    sM.assign(currentFunction, var, "%rax");
  }
  public void visit(Cstring c) {
    if (Compile.debug)
      System.out.println(c+" contain : "+c.s +" lenght : "+c.s.length());
    // free needed reg
    sM.freeReg(currentFunction, "%rdi");
    sM.freeReg(currentFunction, "%rsi");
    sM.freeReg(currentFunction, "%rax");

    result.movq(c.s.length(), "%rsi");// get the length of the string to construct
    result.leaq("17(,%rsi,1)", "%rdi");// get the length of the memory to allocate 17 = 2*8 + 1

    result.call("_my_malloc");// allocate memory for the list

    result.movq(3, "(%rax)");// store the type of the list
    result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory

    // fill the allocated memory
    result.dlabel(currentFunction.toString()+"_"+currentFunction.tmp);
    result.string(c.s);

    //args
    result.leaq("16(%rax)","%rdi");
    result.movq("$"+currentFunction.toString()+"_"+currentFunction.tmp++, "%rsi");

    result.call("_my_strcpy");//copy

    // update memory state
    sM.assign(currentFunction, var, "%rax");
  }
  public void visit(Cint c) {
    // clean the reg
    sM.freeReg(currentFunction, "%rax");
    sM.freeReg(currentFunction, "%rdi");

    // Set up args
    result.movq("$16", "%rdi");

    // allocate memory for the int
    result.call("_my_malloc");

    // Set up the var as int
    result.movq(2, "(%rax)");
    result.movq("$"+c.i, "8(%rax)");

    // update memory state
    sM.assign(currentFunction, var, "%rax");
  }
  public void visit(TEcst e)  {
    if (Compile.debug)
      System.out.println("compiling " + e.c + " in " + var.name);

    e.c.accept(this);
  }
  public void visit(TEbinop e)  {
    Variable v;
    if (Compile.debug)
      System.out.println("compiling " + e.op + " of " + e.e1.toString() + " and " + e.e2.toString());

    switch (e.op) {
      case Band : case Bor :
        // compile only var
        e.e1.accept(this);
        // no compilation of e2 for now (lazy evaluation)
        v = var;// useless code but compiler complain if not wroten
        break;
      default :
        // compile the expressions
        e.e2.accept(this);
        v = var;
        var = sM.createTmp(currentFunction);
        e.e1.accept(this);

        // check the type of the variables aren't None
        result.cmpq(0, "("+sM.getRegFor(currentFunction, v)+")");
        result.je("_Error_gestion");
        result.cmpq(0, "("+sM.getRegFor(currentFunction, var)+")");
        result.je("_Error_gestion");
    }
    String tmp, tmp2;

    switch (e.op) {
      case Badd :
        // labels
        // type check labels
        String Badd_int_check = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Badd_string_check = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Badd_list_check = currentFunction.toString() + "_" + currentFunction.tmp++;
        // operations labels
        String Badd_int = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Badd_string = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Badd_list = currentFunction.toString() + "_" + currentFunction.tmp++;
        // exit labels
        String Badd_end = currentFunction.toString() + "_" + currentFunction.tmp++;
        // type check
        result.cmpq(2, "("+sM.getRegFor(currentFunction, v)+")");
        result.je(Badd_int_check);
        result.cmpq(3, "("+sM.getRegFor(currentFunction, v)+")");
        result.je(Badd_string_check);
        result.cmpq(4, "("+sM.getRegFor(currentFunction, v)+")");
        result.je(Badd_list_check);
        result.jmp("_Error_gestion");
        // int case
        result.label(Badd_int_check);
        result.cmpq(2, "("+sM.getRegFor(currentFunction, var)+")");
        result.je(Badd_int);
        result.jmp("_Error_gestion");
        result.label(Badd_int);
        result.movq("8("+sM.getRegFor(currentFunction, v)+")", sM.getRegFor(currentFunction, v));
        result.addq(sM.getRegFor(currentFunction, v), "8("+sM.getRegFor(currentFunction, var)+")");
        result.jmp(Badd_end);
        // string case
        result.label(Badd_string_check);
        result.cmpq(3, "("+sM.getRegFor(currentFunction, var)+")");
        result.je(Badd_string);
        result.jmp("_Error_gestion");
        result.label(Badd_string);
        // free needed reg
        sM.freeReg(currentFunction, "%rdi"); currentFunction.reg_age.put("%rdi", currentFunction.age);
        sM.freeReg(currentFunction, "%rsi"); currentFunction.reg_age.put("%rsi", currentFunction.age);
        sM.freeReg(currentFunction, "%rax"); currentFunction.reg_age.put("%rax", currentFunction.age++);
        tmp = sM.getRegFor(currentFunction, v);// arg 1
        tmp2 = sM.getRegFor(currentFunction, var);// arg 2
        // get the length of the new string to %rsi
        result.movq("8("+ tmp +")", "%rsi");
        result.addq("8("+ tmp2 +")", "%rsi");// get the length of the string to construct
        result.leaq("17(,%rsi,1)", "%rdi");// get the length of the memory to allocate 17 = 2*8 + 1
        result.call("_my_malloc");// allocate memory for the list
        result.movq(3, "(%rax)");// store the type of the list
        result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory
        // fill the allocated memory
        result.leaq("16("+tmp+")", "%rsi");
        result.leaq("16(%rax)", "%rdi");
        result.movq("%rax", tmp);// save the address of the new var
        result.call("_my_strcpy");//copy the first string
        result.leaq("16("+tmp2+")", "%rsi");
        result.leaq("16("+tmp+")", "%rdi");
        result.call("_my_strcat");//copy the second string
        result.subq("$16", tmp);// make th epointer point to the var
        // update memory state
        sM.killTmp(currentFunction,var);
        sM.killTmp(currentFunction,v);
        currentFunction.memory.put(tmp, var);
        currentFunction.reg_age.put(tmp, currentFunction.age++);
        currentFunction.reg_age.put("%rdi", -1);
        currentFunction.reg_age.put("%rsi", -1);
        currentFunction.reg_age.put("%rax", -1);
        result.jmp(Badd_end);
        // list case
        result.label(Badd_list_check);
        result.cmpq(4, "("+sM.getRegFor(currentFunction, var)+")");
        result.je(Badd_list);
        result.jmp("_Error_gestion");
        result.label(Badd_list);
        // save used registers
        sM.freeReg(currentFunction, "%rdi"); currentFunction.reg_age.put("%rdi", currentFunction.age);
        sM.freeReg(currentFunction, "%rsi"); currentFunction.reg_age.put("%rsi", currentFunction.age);
        sM.freeReg(currentFunction, "%rax"); currentFunction.reg_age.put("%rax", currentFunction.age++);
        String Badd_list_loop_1 = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Badd_list_loop_2 = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Badd_list_skip_1 = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Badd_list_skip_2 = currentFunction.toString() + "_" + currentFunction.tmp++;
        // get the length of the new list to %rsi
        tmp = sM.getRegFor(currentFunction, v);
        tmp2 = sM.getRegFor(currentFunction, var);
        result.movq("8("+ tmp +")", "%rsi");
        result.addq("8("+ tmp2 +")", "%rsi");// get the length of the list to construct
        result.leaq("16(,%rsi,8)", "%rdi");// get the length of the memory to allocate
        result.call("_my_malloc");// allocate memory for the list
        result.movq(4, "(%rax)");// store the type of the list
        result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory
        // first list
        result.cmpq(0, "8("+ tmp +")");
        result.je(Badd_list_skip_1);// if len(list_1) <=0, nothing need to be done
        result.xorq("%rdi", "%rdi");// %rdi = 0
        result.label(Badd_list_loop_1);
        result.movq("16("+tmp+",%rdi,8)", "%rsi");// store the elements of the list_1 to the allocated memory
        result.movq("%rsi", "16(%rax,%rsi,8)");
        result.incq("%rdi");// increment the counter
        result.cmpq("%rdi", "%rsi");
        result.jl(Badd_list_loop_1);
        result.label(Badd_list_skip_1);
        // second list
        result.cmpq(0, "8("+ tmp +")");
        result.je(Badd_list_skip_2);// if len(list_2) <=0, nothing need to be done
        result.xorq("%rdi", "%rdi");// %rdi = 0
        result.label(Badd_list_loop_2);
        result.movq("16("+tmp2+",%rdi,8)", "%rsi");// store the elements of the list_2 to the allocated memory
        result.movq("%rsi", "16(%rax,%rsi,8)");
        result.incq("%rdi");// increment the counter
        result.cmpq("%rdi", "%rsi");
        result.jl(Badd_list_loop_2);
        result.label(Badd_list_skip_2);
        // update memory state
        sM.killTmp(currentFunction,var);
        sM.killTmp(currentFunction,v);
        currentFunction.memory.put(tmp, var);
        currentFunction.reg_age.put(tmp, currentFunction.age++);
        currentFunction.reg_age.put("%rdi", -1);
        currentFunction.reg_age.put("%rsi", -1);
        currentFunction.reg_age.put("%rax", -1);
        result.jmp(Badd_end);

        // exit 
        result.label(Badd_end);

      case Bsub :
        // check type of v
        result.cmpq(2, "("+sM.getRegFor(currentFunction, v)+")");
        result.jne("_Error_gestion");
        // check type of var
        result.cmpq(2, "("+sM.getRegFor(currentFunction, var)+")");
        result.jne("_Error_gestion");
        // load the value of v
        tmp = sM.getRegFor(currentFunction, v);
        if (sM.killTmp(currentFunction,v))
          tmp2 = tmp;// if v is a temporary variable, we can use the same register
        else
          tmp2 = sM.getReg(currentFunction);
        result.movq("8("+ tmp +")", tmp2);
        // do the sub and put result in var
        tmp = sM.getRegFor(currentFunction, var);
        result.subq(tmp2, "8("+ tmp +")");
        sM.freeReg(currentFunction, tmp2); 
        return;

      case Bmul :
        // check type of v
        result.cmpq(2, "("+sM.getRegFor(currentFunction, v)+")");
        result.jne("_Error_gestion");
        // check type of var
        result.cmpq(2, "("+sM.getRegFor(currentFunction, var)+")");
        result.jne("_Error_gestion");
        // load the value of v
        tmp = sM.getRegFor(currentFunction, v);
        if (sM.killTmp(currentFunction,v))
          tmp2 = tmp;// if v is a temporary variable, we can use the same register
        else
          tmp2 = sM.getReg(currentFunction);
        result.movq("8("+ tmp +")", tmp2);
        // do the mult and put result in var
        result.imulq(tmp2, "8("+sM.getRegFor(currentFunction, var)+")");
        sM.freeReg(currentFunction, tmp2);
        return;

      case Bdiv :
        // check type of v
        result.cmpq(2, "("+sM.getRegFor(currentFunction, v)+")");
        result.jne("_Error_gestion");
        // check type of var
        result.cmpq(2, "("+sM.getRegFor(currentFunction, var)+")");
        result.jne("_Error_gestion");
        // load the value of var in %rax
        if (var == currentFunction.memory.get("%rax")){
          result.movq("8("+ sM.getRegFor(currentFunction, var) +")", "%rax");
          sM.freeReg(currentFunction, "%rdx");
        }
        else if (var == currentFunction.memory.get("%rdx")){
          sM.freeReg(currentFunction, "%rax");
          result.movq("8("+ sM.getRegFor(currentFunction, var) +")", "%rax");
        }
        else {
          sM.freeReg(currentFunction, "%rax");
          result.movq("8("+ sM.getRegFor(currentFunction, var) +")", "%rax");
          sM.freeReg(currentFunction, "%rdx");
        }
        // update memory state
        currentFunction.memory.put("%rax", var);
        currentFunction.reg_age.put("%rax", currentFunction.age++);
        currentFunction.reg_age.put("%rdx", currentFunction.age);
        // load the value of v in tmp2
        tmp2 = sM.getRegFor(currentFunction, v);
        // do the div and put result in var
        result.cqto();
        result.idivq(tmp2);
        // update memory state so that the result is in var
        sM.killTmp(currentFunction,v);
        currentFunction.memory.put("%rax", var);
        currentFunction.reg_age.put("%rax", currentFunction.age++);
        if (tmp2 != "%rax") {
          currentFunction.memory.remove(tmp2);
          currentFunction.reg_age.put(tmp2, -1);
          if (Compile.debug) {
            System.out.println("memory state : "+currentFunction.memory.toString());
            System.out.println("registers age : "+currentFunction.reg_age.toString());
          }
        }
        return;

      case Bmod :
        // check type of v
        result.cmpq(2, "("+sM.getRegFor(currentFunction, v)+")");
        result.jne("_Error_gestion");
        // check type of var
        result.cmpq(2, "("+sM.getRegFor(currentFunction, var)+")");
        result.jne("_Error_gestion");
        // load the value of var in %rax
        if (var == currentFunction.memory.get("%rax")){
          result.movq("8("+ sM.getRegFor(currentFunction, var) +")", "%rax");
          sM.freeReg(currentFunction, "%rdx");
        }
        else if (var == currentFunction.memory.get("%rdx")){
          sM.freeReg(currentFunction, "%rax");
          result.movq("8("+ sM.getRegFor(currentFunction, var) +")", "%rax");
        }
        else {
          sM.freeReg(currentFunction, "%rax");
          result.movq("8("+ sM.getRegFor(currentFunction, var) +")", "%rax");
          sM.freeReg(currentFunction, "%rdx");
        }
        // update memory state
        currentFunction.memory.put("%rax", var);
        currentFunction.reg_age.put("%rax", currentFunction.age++);
        currentFunction.reg_age.put("%rdx", currentFunction.age);
        // load the value of v in tmp2
        tmp2 = sM.getRegFor(currentFunction, v);
        // do the div and put result in var
        result.cqto();
        result.idivq(tmp2);
        // update memory state so that the result is in var
        sM.killTmp(currentFunction,v);
        currentFunction.memory.put("%rdx", var);
        currentFunction.reg_age.put("%rdx", currentFunction.age++);
        if (tmp2 != "%rdx") {
          currentFunction.memory.remove(tmp2);
          currentFunction.reg_age.put(tmp2, -1);
          if (Compile.debug) {
            System.out.println("memory state : "+currentFunction.memory.toString());
            System.out.println("registers age : "+currentFunction.reg_age.toString());
          }
        }
        return;

      // comparisons cases
      case Beq : case Bneq : case Blt : case Ble : case Bgt : case Bge :
        // free needed reg
        sM.freeReg(currentFunction, "%rdi");
        sM.freeReg(currentFunction, "%rsi");
        sM.freeReg(currentFunction, "%rax");
        currentFunction.reg_age.put("%rdi", currentFunction.age);
        currentFunction.reg_age.put("%rsi", currentFunction.age);
        currentFunction.reg_age.put("%rax", currentFunction.age++);
        // move var in %rdi
        result.movq(sM.getRegFor(currentFunction, var), "%rdi");
        // move v in %rsi
        result.movq(sM.getRegFor(currentFunction, v), "%rsi");
        switch (e.op) {// set up the type check
          case Beq : case Bneq :
            result.movq(0,"%rax");
            break;
          case Blt : case Ble : case Bgt : case Bge :
            result.movq(1,"%rax");
            break;
          default :
            System.out.println("Error: unknown comparison operator");
            return;
        }
        // do the comparison
        result.call("_my_compare");
        // put the result in var
        currentFunction.reg_age.put("%rax", currentFunction.age++);
        currentFunction.reg_age.put("%rdi", -1);
        currentFunction.reg_age.put("%rsi", -1);
        sM.killTmp(currentFunction,v);
        result.movq(1, "("+sM.getRegFor(currentFunction, var)+")");
        result.cmpq(0, "%rax");
        String False_label = currentFunction.toString() + "_" + currentFunction.tmp++;
        String end = currentFunction.toString() + "_" + currentFunction.tmp++;
        switch (e.op) {// ( 0 if equal, -1 if %rdi < %rsi, 1 if %rdi > %rsi )
          case Beq :
            result.jne(False_label);
            result.movq(1, "8("+sM.getRegFor(currentFunction, var)+")");
            result.jmp(end);
            result.label(False_label);
            result.movq(0, "8("+sM.getRegFor(currentFunction, var)+")");
            break;
          case Bneq :
            result.je(False_label);
            result.movq(1, "8("+sM.getRegFor(currentFunction, var)+")");
            result.jmp(end);
            result.label(False_label);
            result.movq(0, "8("+sM.getRegFor(currentFunction, var)+")");
            break;
          case Blt :
            result.jge(False_label);
            result.movq(1, "8("+sM.getRegFor(currentFunction, var)+")");
            result.jmp(end);
            result.label(False_label);
            result.movq(0, "8("+sM.getRegFor(currentFunction, var)+")");
            break;
          case Ble :
            result.jg(False_label);
            result.movq(1, "8("+sM.getRegFor(currentFunction, var)+")");
            result.jmp(end);
            result.label(False_label);
            result.movq(0, "8("+sM.getRegFor(currentFunction, var)+")");
            break;
          case Bgt :
            result.jle(False_label);
            result.movq(1, "8("+sM.getRegFor(currentFunction, var)+")");
            result.jmp(end);
            result.label(False_label);
            result.movq(0, "8("+sM.getRegFor(currentFunction, var)+")");
            break;
          case Bge :
            result.jl(False_label);
            result.movq(1, "8("+sM.getRegFor(currentFunction, var)+")");
            result.jmp(end);
            result.label(False_label);
            result.movq(0, "8("+sM.getRegFor(currentFunction, var)+")");
            break;
          default :
            System.out.println("Error: unknown comparison operator");
            return;
        }
        result.label(end);
        // update memory state
        currentFunction.reg_age.put("%rax", -1);
        return;

      case Band :
        // do the lazy evaluation
        String Band_end = currentFunction.toString() + "_" + currentFunction.tmp++;
        // test v
        result.cmpq(0, "8("+sM.getRegFor(currentFunction, var)+")");
        result.je(Band_end);
        // test var
        e.e2.accept(this);
        // exit
        result.label(Band_end);
        return;
      case Bor :
        // do the lazy evaluation
        String Bor_end = currentFunction.toString() + "_" + currentFunction.tmp++;
        // test v
        result.cmpq(0, "8("+sM.getRegFor(currentFunction, var)+")");
        result.jne(Bor_end);
        // test var
        e.e2.accept(this);
        // exit
        result.label(Bor_end);
        return;
    }
  }

  public void visit(TErange e) {
    if (Compile.debug)
      System.out.println("compiling range of "+ e.e.toString() + " in " + var.name);
    e.e.accept(this);
    sM.freeReg(currentFunction, "%rdi");
    currentFunction.reg_age.put("%rdi", currentFunction.age++);
    result.movq(sM.getRegFor(currentFunction, var), "%rdi");
    sM.freeReg(currentFunction, sM.getRegFor(currentFunction, var));
    result.call("range");
  }
  public void visit(TElist e) {
    if (Compile.debug)
      System.out.println("compiling list from "+e.l);
    // créer une liste a partir d'une liste d'expression
    sM.freeReg(currentFunction, "%rdi"); currentFunction.reg_age.put("%rdi", currentFunction.age);
    sM.freeReg(currentFunction, "%rsi"); currentFunction.reg_age.put("%rsi", currentFunction.age);
    sM.freeReg(currentFunction, "%rax"); currentFunction.reg_age.put("%rax", currentFunction.age++);
    // get the length of the new list to %rsi
    result.movq(e.l.size(), "%rsi");// get the length of the list to construct
    result.leaq("16(,%rsi,8)", "%rdi");// get the length of the memory to allocate
    result.call("_my_malloc");// allocate memory for the list
    result.movq(4, "(%rax)");// store the type of the list
    result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory
    // update memory state
    Variable v = var;
    currentFunction.memory.put("%rax", v);
    currentFunction.reg_age.put("%rsi", -1);
    currentFunction.reg_age.put("%rdi", -1);
    // fill the list
    int i = 0;
    for (TExpr expr : e.l) {
      var = sM.createTmp(currentFunction);
      expr.accept(this);
      sM.freeReg(currentFunction, "%rax");
      currentFunction.reg_age.put("%rax", currentFunction.age++);
      result.movq(i++, "%rax");
      result.movq(sM.getRegFor(currentFunction, var), "16("+sM.getRegFor(currentFunction, v)+",%rax,8)");
      sM.killTmp(currentFunction,var);
      currentFunction.reg_age.put("%rax", -1);
    }
    var = v;
  }
  public void visit(TEunop e) {
    if (Compile.debug)
      System.out.println("compiling " + e.op + " of " + e.e.toString() + " in " + var.name);

    e.e.accept(this);

    switch (e.op) {
      case Uneg :
        result.cmpq(2, "("+sM.getRegFor(currentFunction, var)+")");
        result.jne("_Error_gestion");
        result.negq("8("+sM.getRegFor(currentFunction, var)+")");
        return;
      case Unot :
        String Unot_false = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Unot_end = currentFunction.toString() + "_" + currentFunction.tmp++;
        result.movq(1,"("+sM.getRegFor(currentFunction, var)+")");// transform var in int type
        result.cmpq(0, "8("+sM.getRegFor(currentFunction, var)+")");
        result.je(Unot_false);
        result.movq(1, "8("+sM.getRegFor(currentFunction, var)+")");
        result.jmp(Unot_end);
        result.label(Unot_false);
        result.movq(0, "8("+sM.getRegFor(currentFunction, var)+")");
        result.label(Unot_end);
        return;
    }

  }
  public void visit(TEident e) {
    if (Compile.debug)
      System.out.println("compiling " + e.x.name + " in " + var.name);
    sM.freeReg(currentFunction, "%rdi"); currentFunction.reg_age.put("%rdi", currentFunction.age);
    sM.freeReg(currentFunction, "%rsi"); currentFunction.reg_age.put("%rsi", currentFunction.age);
    sM.freeReg(currentFunction, "%rax"); currentFunction.reg_age.put("%rax", currentFunction.age++);

    if (currentFunction.memory.containsValue(e.x)) 
      sM.freeReg(currentFunction, sM.getRegFor(currentFunction, e.x));// save the pointer to the variable
    String reg = sM.getRegFor(currentFunction, e.x);
    
    // labels
    String TEident_int = currentFunction.toString() + "_" + currentFunction.tmp++;
    String TEident_string = currentFunction.toString() + "_" + currentFunction.tmp++;
    String TEident_list = currentFunction.toString() + "_" + currentFunction.tmp++;
    String TEident_bool = currentFunction.toString() + "_" + currentFunction.tmp++;
    String TEident_end = currentFunction.toString() + "_" + currentFunction.tmp++;
    // check type
    result.cmpq(2, "("+reg+")");
    result.je(TEident_int);
    result.cmpq(3, "("+reg+")");
    result.je(TEident_string);
    result.cmpq(4, "("+reg+")");
    result.je(TEident_list);
    result.cmpq(1, "("+reg+")");
    result.je(TEident_bool);
    // None
    result.movq(reg, sM.getRegFor(currentFunction, var));
    result.jmp(TEident_end);
    // int
    result.label(TEident_int);
    result.movq(16, "%rdi");
    result.call("_my_malloc");
    result.movq(2, "(%rax)");
    result.movq("8("+reg+")", "%rdi");
    result.movq("%rdi", "8(%rax)");
    result.movq("%rax", reg);// save the address of the new var
    result.jmp(TEident_end);
    // bool
    result.label(TEident_bool);
    result.movq(16, "%rdi");
    result.call("_my_malloc");
    result.movq(1, "(%rax)");
    result.movq("8("+reg+")", "%rdi");
    result.movq("%rdi", "8(%rax)");
    result.movq("%rax", reg);// save the address of the new var
    result.jmp(TEident_end);
    // string
    result.label(TEident_string);
    result.movq("8("+ reg +")", "%rsi");// get the length of the new string to %rsi
    result.leaq("17(,%rsi,1)", "%rdi");// get the length of the memory to allocate 17 = 2*8 + 1
    result.call("_my_malloc");// allocate memory for the list
    result.movq(3, "(%rax)");// store the type of the list
    result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory
    // fill the allocated memory
    result.leaq("16("+reg+")", "%rsi");
    result.leaq("16(%rax)", "%rdi");
    reg = sM.getReg(currentFunction);
    result.movq("%rax", reg);// save the address of the new var
    result.call("_my_strcpy");//copy the first string
    result.subq("$16", reg);// make the pointer point to the var
    result.jmp(TEident_end);
    // list
    result.label(TEident_list);
    // get the length of the new list to %rsi
    result.movq("8("+reg+")", "%rsi");// get the length of the list to construct
    result.leaq("16(,%rsi,8)", "%rdi");// get the length of the memory to allocate
    result.call("_my_malloc");// allocate memory for the list
    result.movq(4, "(%rax)");// store the type of the list
    result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory
    // fill the list
    result.xorq("%rdi","%rdi");// counter
    String TEident_list_loop = currentFunction.toString() + "_" + currentFunction.tmp++;
    String TEident_list_end = currentFunction.toString() + "_" + currentFunction.tmp++;
    result.cmpq("%rdi", "8("+reg+")");
    result.je(TEident_list_end);
    // loop
    result.label(TEident_list_loop);
    result.movq("16("+reg+",%rdi,8)", "%rsi");
    result.movq("%rsi", "16(%rax,%rdi,8)");
    result.incq("%rdi");
    // test loop
    result.cmpq("%rdi", "8("+reg+")");
    result.je(TEident_list_end);
    result.jmp(TEident_list_loop);
    // loop end
    result.label(TEident_list_end);
    result.movq("%rax", reg);// save the address of the new var
    // exit
    result.label(TEident_end);
    // update memory state
    sM.assign(currentFunction, var, reg); 
    currentFunction.reg_age.put("%rdi", -1);
    currentFunction.reg_age.put("%rsi", -1);
    currentFunction.reg_age.put("%rax", -1);
  }
  public void visit(TEcall e) {
    if (Compile.debug)
      System.out.println("compiling call to " + e.f.name + " in " + currentFunction.name);

    String called_label = e.f.name + "_" + e.f.uid;
    if (e.f.name.equals("list") || e.f.name.equals("range") || e.f.name.equals("len")) 
      called_label = e.f.name;

    int nb_args = e.f.params.size();
    Variable[] args = new Variable[nb_args];
    // visite the args expressions
    int i = 0;
    for (TExpr arg : e.l) {
      arg.accept(this);
      args[i++] = var;
      var = sM.createTmp(currentFunction);
    }
    // put the args in the right registers
    for (int cpt = 0; cpt < ((nb_args<6)?nb_args:6); cpt++) {
      if (sM.getRegFor(currentFunction, args[cpt]) != registers[cpt])
        sM.freeReg(currentFunction, registers[cpt]);
      result.movq(sM.getRegFor(currentFunction, args[cpt]), registers[cpt]);
    }
    // rest in the stack
    if (nb_args > 6) {
      for (int cpt = nb_args-1; cpt >= 6; cpt--) {
        result.pushq(sM.getRegFor(currentFunction, args[cpt]));
      }
    }
    // call the function
    result.pushq("-8(%rbp)");
    result.call(called_label);
    //reset the stack
    if (nb_args > 6) {
      result.addq("$"+(nb_args-6+1)*8, "%rsp");
    } else {
      result.addq("$8", "%rsp");
    }
    // update memory state
    for (i = 0; i < nb_args; i++) {
      sM.killTmp(currentFunction,args[i]);
    }
    for (int cpt = 0; cpt < ((nb_args<6)?nb_args:6); cpt++) {
      currentFunction.reg_age.put(registers[cpt], -1);
    }
    var = sM.createTmp(currentFunction);
    sM.assign(currentFunction, var, "%rax");
  }
  public void visit(TEget e) {
    // get the element e2 of a list e1
    if (Compile.debug)
      System.out.println("compiling get instruction");

    // get the list
    e.e1.accept(this);
    Variable list = var;
    result.cmpq(4, "("+sM.getRegFor(currentFunction, list)+")");
    result.jne("_Error_gestion");
    // get the index
    var = sM.createTmp(currentFunction);
    Variable index = var;
    e.e2.accept(this);
    result.cmpq(2, "("+sM.getRegFor(currentFunction, index)+")");
    result.jne("_Error_gestion");
    // check if the index is in the list
    String tmp = sM.getReg(currentFunction);
    result.movq("8("+sM.getRegFor(currentFunction, index)+")", tmp);
    result.cmpq(tmp, "8("+sM.getRegFor(currentFunction, list)+")");
    result.jge("_Error_gestion");
    // put the variable list[index] in var
    result.movq("8("+sM.getRegFor(currentFunction, index)+")", tmp);
    result.movq("16("+sM.getRegFor(currentFunction, list)+","+tmp+",8)", sM.getRegFor(currentFunction, var));
    sM.freeReg(currentFunction, tmp);
    sM.killTmp(currentFunction,list);
  }
  public void visit(TSif s) {
    // if e then s1 else s2
    if (Compile.debug)
      System.out.println("compiling if in " + currentFunction.name);

    String if_else = currentFunction.toString() + "_" + currentFunction.tmp++;
    String if_end = currentFunction.toString() + "_" + currentFunction.tmp++;
    
    var = sM.createTmp(currentFunction);
    s.e.accept(this);
    result.cmpq(0, "8("+sM.getRegFor(currentFunction, var)+")");
    result.je(if_else);
    s.s1.accept(this);
    result.jmp(if_end);
    result.label(if_else);
    s.s2.accept(this);
    result.label(if_end);
  }
  public void visit(TSreturn s) {
    if (Compile.debug)
      System.out.println("compiling return in " + currentFunction.name);

    var = sM.createTmp(currentFunction);
    s.e.accept(this);
    result.movq(sM.getRegFor(currentFunction, var), "%rax");// result in %rax
    
    // restore the calle saved registers
    sM.restoreCalleSavedRegisters(currentFunction);

    // Restore the stack pointer and return*
    result.movq("%rbp", "%rsp");
    result.popq("%rbp");
    result.ret();
  }
  public void visit(TSassign s) {
    // assign the value of the expression e to the variable x
    if (Compile.debug)
      System.out.println("compiling assignement of " + s.x.name);

    var = s.x;
    s.e.accept(this);
  }
  public void visit(TSprint s) {
    // print the value of the expression e
    if (Compile.debug)
      System.out.println("printing " + s.e.toString());

    var = sM.createTmp(currentFunction);
    s.e.accept(this);
    sM.freeReg(currentFunction, "%rdi");
    String tmp = sM.getRegFor(currentFunction, var);
    if (!tmp.equals("%rdi"))
      result.movq(sM.getRegFor(currentFunction, var), "%rdi");
    result.call("print");
  }
  public void visit(TSblock s) {
    if (Compile.debug)
      System.out.println("compiling block in " + currentFunction.name);
    for (TStmt statement : s.l) {
      statement.accept(this);
    }
  }
  public void visit(TSfor s) {
    // for x in e do s
    if (Compile.debug)
      System.out.println("compiling for in " + currentFunction.name);

    // labels
    String TSfor_loop = currentFunction.toString() + "_" + currentFunction.tmp++;
    String TSfor_end = currentFunction.toString() + "_" + currentFunction.tmp++;
    // get the list
    var = sM.createTmp(currentFunction);
    s.e.accept(this);
    Variable list = var;
    String tmp = sM.getRegFor(currentFunction, list);
    result.cmpq(4, "("+tmp+")");
    result.jne("_Error_gestion");
    // free the registers
    for (int i = 0; i < registers.length; i++) {
      if (!tmp.equals(registers[i]))
        sM.freeReg(currentFunction, registers[i]);
    }
    // loop
    result.xorq("%rdi","%rdi");// counter
    result.label(TSfor_loop);
    currentFunction.reg_age.put("%rdi", currentFunction.age++);
    result.cmpq("%rdi", "8("+sM.getRegFor(currentFunction, list)+")");
    result.je(TSfor_end);
    if (Compile.debug)
      System.out.println("putting "+s.x.name+" in "+sM.getRegFor(currentFunction, s.x)) ;
    // get the element list[i] in x
    result.movq("16("+sM.getRegFor(currentFunction, list)+",%rdi,8)", sM.getRegFor(currentFunction, s.x));
    currentFunction.reg_age.put("%rdi", -1);
    // execute the block
    result.pushq("%rdi"); // save the counter
    s.s.accept(this);
    // increment the counter
    sM.freeReg(currentFunction, "%rdi");
    result.popq("%rdi");
    result.incq("%rdi");
    // loop end
    result.jmp(TSfor_loop);
    result.label(TSfor_end);
    sM.killTmp(currentFunction,list);

  }
  public void visit(TSeval s) {
    if (Compile.debug)
      System.out.println("compiling eval of "+ s.e +" in "+ currentFunction.name);
    var = sM.createTmp(currentFunction);
    s.e.accept(this);
  }
  public void visit(TSset s) {
    // set the element e2 of a list e1 to a value e3
    if (Compile.debug)
      System.out.println("compiling set instruction");

    // get the list
    var = sM.createTmp(currentFunction);
    s.e1.accept(this);
    Variable list = var;
    result.cmpq(4, "("+sM.getRegFor(currentFunction, list)+")");
    result.jne("_Error_gestion");
    // get the index
    var = sM.createTmp(currentFunction);
    Variable index = var;
    s.e2.accept(this);
    result.cmpq(2, "("+sM.getRegFor(currentFunction, index)+")");
    result.jne("_Error_gestion");
    // check if the index is in the list
    String tmp = sM.getReg(currentFunction);
    result.movq("8("+sM.getRegFor(currentFunction, index)+")", tmp);
    result.cmpq(tmp, "8("+sM.getRegFor(currentFunction, list)+")");
    result.jge("_Error_gestion");
    // get the value
    var = sM.createTmp(currentFunction);
    s.e3.accept(this);
    // put the variable var in list[index]
    result.movq("8("+sM.getRegFor(currentFunction, index)+")", tmp);
    result.movq(sM.getRegFor(currentFunction, var), "16("+sM.getRegFor(currentFunction, list)+","+tmp+",8)");
    sM.freeReg(currentFunction, tmp);
    sM.killTmp(currentFunction,list);
    sM.killTmp(currentFunction,index);
  }
}
