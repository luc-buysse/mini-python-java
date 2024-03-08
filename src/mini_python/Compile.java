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
        && !d.f.name.equals(".my_malloc") // preimplanted functions
        && !d.f.name.equals("main")) // main function
        visit(d);
    }

    // Generate code for the preimplanted function
    implementPrint();
    implementRange();
    implementLen();
    implementList();
    implementMalloc();
    implementStrcpy();
    implementstrcmp();
    implementCompare();

    // error gestion code
    implementErrorGestion();

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

    // if main, exit
    if (d.f.name.equals("main")) {
      result.xorq("%rdx", "%rdx");
      result.emit("syscall exit");
      // TODO check how to exit properly
    }

    // Restore the stack pointer and return*
    result.movq("%rbp", "%rsp");
    result.popq("%rbp");
    result.ret();
  }
  public void visit(Cnone c) {
    String reg = getRegFor(var);
    result.movq(".None", reg);
  }
  public void visit(Cbool c) {
    // clean the reg
    freeReg("%rax");
    freeReg("%rdi");

    // Set up args
    result.movq("$16", "%rdi");

    // allocate memory for the boolean
    result.call(".my_malloc");

    // Set up the var as boolean
    result.movq(1, "(%rax)");
    result.movq( c.b ? 1:0, "4(%rax)");

    // update memory state
    currentFunction.reg_age.put("%rax", currentFunction.age++);
    if (currentFunction.memory.containsValue(var))
      freeReg(currentFunction.memory.entrySet().stream().filter(entry -> entry.getValue().equals(var)).findFirst().get().getKey());
    currentFunction.memory.put("%rax", var);
  }
  public void visit(Cstring c) {
    // free needed reg
    freeReg("%rdi");
    freeReg("%rsi");
    freeReg("%rax");

    result.movq(c.s.length(), "%rsi");// get the length of the string to construct
    result.leaq("17(,%rsi,1)", "%rdi");// get the length of the memory to allocate 17 = 2*8 + 1

    result.call(".my_malloc");// allocate memory for the list

    result.movq(3, "(%rax)");// store the type of the list
    result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory

    // fill the allocated memory
    result.dlabel(currentFunction.toString()+var.name);
    result.string(c.s);

    //args
    result.leaq("16(%rax)","%rdi");
    result.movq(currentFunction.toString()+var.name, "%rsi");

    result.call(".my_strcpy");//copy

    // update memory state
    currentFunction.reg_age.put("%rax", currentFunction.age++);
    if (currentFunction.memory.containsValue(var))
      freeReg(currentFunction.memory.entrySet().stream().filter(entry -> entry.getValue().equals(var)).findFirst().get().getKey());;
    currentFunction.memory.put("%rax", var);
  }
  public void visit(Cint c) {
    // clean the reg
    freeReg("%rax");
    freeReg("%rdi");

    // Set up args
    result.movq("$16", "%rdi");

    // allocate memory for the int
    result.call(".my_malloc");

    // Set up the var as int
    result.movq(2, "(%rax)");
    result.movq("$"+c.i, "4(%rax)");

    // update memory state
    currentFunction.reg_age.put("%rax", currentFunction.age++);
    if (currentFunction.memory.containsValue(var))
      freeReg(currentFunction.memory.entrySet().stream().filter(entry -> entry.getValue().equals(var)).findFirst().get().getKey());;
    currentFunction.memory.put("%rax", var);
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
        var = createTmp();
        e.e1.accept(this);

        // check the type of the variables aren't None
        result.cmpq(0, "("+getRegFor(v)+")");
        result.je(".Error_gestion");
        result.cmpq(0, "("+getRegFor(var)+")");
        result.je(".Error_gestion");
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
        result.cmpq(2, "("+getRegFor(v)+")");
        result.je(Badd_int_check);
        result.cmpq(3, "("+getRegFor(v)+")");
        result.je(Badd_string_check);
        result.cmpq(4, "("+getRegFor(v)+")");
        result.je(Badd_list_check);
        result.jmp(".Error_gestion");
        // int case
        result.label(Badd_int_check);
        result.cmpq(2, "("+getRegFor(var)+")");
        result.je(Badd_int);
        result.jmp(".Error_gestion");
        result.label(Badd_int);
        result.movq("8("+getRegFor(v)+")", getRegFor(v));
        result.addq(getRegFor(v), "8("+getRegFor(var)+")");
        result.jmp(Badd_end);
        // string case
        result.label(Badd_string_check);
        result.cmpq(3, "("+getRegFor(var)+")");
        result.je(Badd_string);
        result.jmp(".Error_gestion");
        result.label(Badd_string);
        // free needed reg
        freeReg("%rdi"); currentFunction.reg_age.put("%rdi", currentFunction.age);
        freeReg("%rsi"); currentFunction.reg_age.put("%rsi", currentFunction.age);
        freeReg("%rax"); currentFunction.reg_age.put("%rax", currentFunction.age++);
        tmp = getRegFor(v);// arg 1
        tmp2 = getRegFor(var);// arg 2
        // get the length of the new string to %rsi
        result.movq("8("+ tmp +")", "%rsi");
        result.addq("8("+ tmp2 +")", "%rsi");// get the length of the string to construct
        result.leaq("17(,%rsi,1)", "%rdi");// get the length of the memory to allocate 17 = 2*8 + 1
        result.call(".my_malloc");// allocate memory for the list
        result.movq(3, "(%rax)");// store the type of the list
        result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory
        // fill the allocated memory
        result.leaq("16("+tmp+")", "%rsi");
        result.addq("16(%rax)", "%rdi");
        result.movq("%rax", tmp);// save the address of the new var
        result.call(".my_strcpy");//copy the first string
        result.leaq("16("+tmp2+")", "%rsi");
        result.addq("16("+tmp+")", "%rdi");
        result.call(".my_strcat");//copy the second string
        result.subq("$16", tmp);// make th epointer point to the var
        // update memory state
        killTmp(var);
        killTmp(v);
        currentFunction.memory.put(tmp, var);
        currentFunction.reg_age.put(tmp, currentFunction.age++);
        currentFunction.reg_age.put("%rdi", -1);
        currentFunction.reg_age.put("%rsi", -1);
        currentFunction.reg_age.put("%rax", -1);
        result.jmp(Badd_end);
        // list case
        result.label(Badd_list_check);
        result.cmpq(4, "("+getRegFor(var)+")");
        result.je(Badd_list);
        result.jmp(".Error_gestion");
        result.label(Badd_list);
        // save used registers
        freeReg("%rdi"); currentFunction.reg_age.put("%rdi", currentFunction.age);
        freeReg("%rsi"); currentFunction.reg_age.put("%rsi", currentFunction.age);
        freeReg("%rax"); currentFunction.reg_age.put("%rax", currentFunction.age++);
        String Badd_list_loop_1 = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Badd_list_loop_2 = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Badd_list_skip_1 = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Badd_list_skip_2 = currentFunction.toString() + "_" + currentFunction.tmp++;
        // get the length of the new list to %rsi
        tmp = getRegFor(v);
        tmp2 = getRegFor(var);
        result.movq("8("+ tmp +")", "%rsi");
        result.addq("8("+ tmp2 +")", "%rsi");// get the length of the list to construct
        result.leaq("16(,%rsi,8)", "%rdi");// get the length of the memory to allocate
        result.call(".my_malloc");// allocate memory for the list
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
        killTmp(var);
        killTmp(v);
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
        result.cmpq(2, "("+getRegFor(v)+")");
        result.jne(".Error_gestion");
        // check type of var
        result.cmpq(2, "("+getRegFor(var)+")");
        result.jne(".Error_gestion");
        // load the value of v
        tmp = getRegFor(v);
        if (killTmp(v))
          tmp2 = tmp;// if v is a temporary variable, we can use the same register
        else
          tmp2 = getReg();
        result.movq("8("+ tmp +")", tmp2);
        // do the sub and put result in var
        tmp = getRegFor(var);
        result.subq(tmp2, "8("+ tmp +")");
        freeReg(tmp2); 
        return;

      case Bmul :
        // check type of v
        result.cmpq(2, "("+getRegFor(v)+")");
        result.jne(".Error_gestion");
        // check type of var
        result.cmpq(2, "("+getRegFor(var)+")");
        result.jne(".Error_gestion");
        // load the value of v
        tmp = getRegFor(v);
        if (killTmp(v))
          tmp2 = tmp;// if v is a temporary variable, we can use the same register
        else
          tmp2 = getReg();
        result.movq("8("+ tmp +")", tmp2);
        // do the mult and put result in var
        result.imulq(tmp2, "8("+getRegFor(var)+")");
        freeReg(tmp2);
        return;

      case Bdiv :
        // check type of v
        result.cmpq(2, "("+getRegFor(v)+")");
        result.jne(".Error_gestion");
        // check type of var
        result.cmpq(2, "("+getRegFor(var)+")");
        result.jne(".Error_gestion");
        // load the value of var in %rax
        if (var == currentFunction.memory.get("%rax")){
          result.movq("8("+ getRegFor(var) +")", "%rax");
          freeReg("%rdx");
        }
        else if (var == currentFunction.memory.get("%rdx")){
          freeReg("%rax");
          result.movq("8("+ getRegFor(var) +")", "%rax");
        }
        else {
          freeReg("%rax");
          result.movq("8("+ getRegFor(var) +")", "%rax");
          freeReg("%rdx");
        }
        // update memory state
        currentFunction.memory.put("%rax", var);
        currentFunction.reg_age.put("%rax", currentFunction.age++);
        currentFunction.reg_age.put("%rdx", currentFunction.age);
        // load the value of v in tmp2
        tmp2 = getRegFor(v);
        // do the div and put result in var
        result.cqto();
        result.idivq(tmp2);
        killTmp(v);
        // update memory state so that the result is in var
        currentFunction.memory.put("%rax", var);
        currentFunction.reg_age.put("%rax", currentFunction.age++);
        if (tmp2 != "%rax") {
          currentFunction.memory.remove(tmp2);
          currentFunction.reg_age.put(tmp2, -1);
        }
        return;

      case Bmod :
        // check type of v
        result.cmpq(2, "("+getRegFor(v)+")");
        result.jne(".Error_gestion");
        // check type of var
        result.cmpq(2, "("+getRegFor(var)+")");
        result.jne(".Error_gestion");
        // load the value of var in %rax
        if (var == currentFunction.memory.get("%rax")){
          result.movq("8("+ getRegFor(var) +")", "%rax");
          freeReg("%rdx");
        }
        else if (var == currentFunction.memory.get("%rdx")){
          freeReg("%rax");
          result.movq("8("+ getRegFor(var) +")", "%rax");
        }
        else {
          freeReg("%rax");
          result.movq("8("+ getRegFor(var) +")", "%rax");
          freeReg("%rdx");
        }
        // update memory state
        currentFunction.memory.put("%rax", var);
        currentFunction.reg_age.put("%rax", currentFunction.age++);
        currentFunction.reg_age.put("%rdx", currentFunction.age);
        // load the value of v in tmp2
        tmp2 = getRegFor(v);
        // do the div and put result in var
        result.cqto();
        result.idivq(tmp2);
        // update memory state so that the result is in var
        killTmp(v);
        currentFunction.memory.put("%rdx", var);
        currentFunction.reg_age.put("%rdx", currentFunction.age++);
        if (tmp2 != "%rdx") {
          currentFunction.memory.remove(tmp2);
          currentFunction.reg_age.put(tmp2, -1);
        }
        return;

      // comparisons cases
      case Beq : case Bneq : case Blt : case Ble : case Bgt : case Bge :
        // free needed reg
        freeReg("%rdi");
        freeReg("%rsi");
        freeReg("%rax");
        currentFunction.reg_age.put("%rdi", currentFunction.age);
        currentFunction.reg_age.put("%rsi", currentFunction.age);
        currentFunction.reg_age.put("%rax", currentFunction.age++);
        // move var in %rdi
        result.movq(getRegFor(var), "%rdi");
        // move v in %rsi
        result.movq(getRegFor(v), "%rsi");
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
        result.call(".my_compare");
        // put the result in var
        currentFunction.reg_age.put("%rax", currentFunction.age++);
        currentFunction.reg_age.put("%rdi", -1);
        currentFunction.reg_age.put("%rsi", -1);
        killTmp(v);
        result.movq(1, "("+getRegFor(var)+")");
        result.cmpq(0, "%rax");
        String False_label = currentFunction.toString() + "_" + currentFunction.tmp++;
        String end = currentFunction.toString() + "_" + currentFunction.tmp++;
        switch (e.op) {// ( 0 if equal, -1 if %rdi < %rsi, 1 if %rdi > %rsi )
          case Beq :
            result.jne(False_label);
            result.movq(1, "8("+getRegFor(var)+")");
            result.jmp(end);
            result.label(False_label);
            result.movq(0, "8("+getRegFor(var)+")");
            break;
          case Bneq :
            result.je(False_label);
            result.movq(1, "8("+getRegFor(var)+")");
            result.jmp(end);
            result.label(False_label);
            result.movq(0, "8("+getRegFor(var)+")");
            break;
          case Blt :
            result.jge(False_label);
            result.movq(1, "8("+getRegFor(var)+")");
            result.jmp(end);
            result.label(False_label);
            result.movq(0, "8("+getRegFor(var)+")");
            break;
          case Ble :
            result.jg(False_label);
            result.movq(1, "8("+getRegFor(var)+")");
            result.jmp(end);
            result.label(False_label);
            result.movq(0, "8("+getRegFor(var)+")");
            break;
          case Bgt :
            result.jle(False_label);
            result.movq(1, "8("+getRegFor(var)+")");
            result.jmp(end);
            result.label(False_label);
            result.movq(0, "8("+getRegFor(var)+")");
            break;
          case Bge :
            result.jl(False_label);
            result.movq(1, "8("+getRegFor(var)+")");
            result.jmp(end);
            result.label(False_label);
            result.movq(0, "8("+getRegFor(var)+")");
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
        String Band_false = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Band_end = currentFunction.toString() + "_" + currentFunction.tmp++;
        // test v
        result.cmpq(0, "8("+getRegFor(var)+")");
        result.je(Band_false);
        // test var
        e.e2.accept(this);
        result.cmpq(0, "8("+getRegFor(var)+")");
        result.je(Band_false);
        // both are true
        result.movq(1, "8("+getRegFor(var)+")");
        result.movq(1, "("+getRegFor(var)+")");
        result.jmp(Band_end);
        // at least one is false
        result.label(Band_false);
        result.movq(0, "8("+getRegFor(var)+")");
        result.movq(1, "("+getRegFor(var)+")");
        // exit
        result.label(Band_end);
        return;
      case Bor :
        // do the lazy evaluation
        String Bor_true = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Bor_end = currentFunction.toString() + "_" + currentFunction.tmp++;
        // test v
        result.cmpq(0, "8("+getRegFor(var)+")");
        result.jne(Bor_true);
        // test var
        e.e2.accept(this);
        result.cmpq(0, "8("+getRegFor(var)+")");
        result.jne(Bor_true);
        // both are false
        result.movq(0, "8("+getRegFor(var)+")");
        result.movq(1, "("+getRegFor(var)+")");
        result.jmp(Bor_end);
        // at least one is true
        result.label(Bor_true);
        result.movq(1, "8("+getRegFor(var)+")");
        result.movq(1, "("+getRegFor(var)+")");
        // exit
        result.label(Bor_end);
        return;
    }
  }

  private void implementCompare() {
    // compare %rdi and %rsi and put the result in %rax ( 0 if equal, -1 if %rdi < %rsi, 1 if %rdi > %rsi )
    result.label(".my_compare");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    if (Compile.debug)
      System.out.println("compiling .my_compare in " + currentFunction.name);

    // check the type of the variables aren't None
    result.cmpq(0, "(%rdi)");
    result.je(".Error_gestion");
    result.cmpq(0, "(%rsi)");
    result.je(".Error_gestion");

    // create operations labels
    // operation labels
    String Beq_Neq = currentFunction.toString() + "_" + currentFunction.tmp++;
    // common type operations labels
    String bool_int_operation = currentFunction.toString() + "_" + currentFunction.tmp++;
    String string_operation = currentFunction.toString() + "_" + currentFunction.tmp++;
    // exit labels
    String inf_t = currentFunction.toString() + "_" + currentFunction.tmp++;
    String eq = currentFunction.toString() + "_" + currentFunction.tmp++;
    String sup_t = currentFunction.toString() + "_" + currentFunction.tmp++;

    // jump to the right operation
    result.cmpq(0, "%rax");
    result.je(Beq_Neq);


    // Comp
    // labels for type check
    String Comp_bool_int_check = currentFunction.toString() + "_" + currentFunction.tmp++;
    String Comp_list_check = currentFunction.toString() + "_" + currentFunction.tmp++;

    // check type of v
    result.cmpq(3, "(%rdi)");
    result.jl(Comp_bool_int_check);
    result.jg(Comp_list_check);
    // check type of v
    // if v is a string
    result.cmpq(3, "(%rsi)");
    result.jne(".Error_gestion");
    result.jmp(string_operation);
    // if v is a boolean or an int
    result.label(Comp_bool_int_check);
    result.cmpq(2, "(%rsi)");
    result.jg(".Error_gestion");
    result.jmp(bool_int_operation);
    // if v is a list
    result.label(Comp_list_check);
    result.cmpq(4, "(%rsi)");
    result.jne(".Error_gestion");

    // do the operation on list
    // internal labels
    String Comp_list1_empty = currentFunction.toString() + "_" + currentFunction.tmp++;
    String Comp_loop = currentFunction.toString() + "_" + currentFunction.tmp++;
    // use %rax as a counter
    result.xorq("%rax", "%rax");
    // loop
    result.label(Comp_loop);
    result.cmpq("%rax", "8(%rdi)");
    result.je(Comp_list1_empty); // exit if 1 is empty
    // 1 not empty
    result.cmpq("%rax", "8(%rsi)");
    result.je(sup_t); // exit if 2 is empty
    // 1 and 2 not empty
    result.movq("16(%rdi,%rax,8)", "%rdi");
    result.movq("16(%rsi,%rax,8)", "%rsi");
    // compare the elements
    result.pushq("%rax");
    result.movq(1, "%rax");
    result.call(".my_compare");
    // exit loop if the elements are different
    result.cmpq(1, "%rax");
    result.je(inf_t);
    result.jg(sup_t);
    // elements are equal
    result.popq("%rax");
    result.incq("%rax");
    result.jmp(Comp_loop);
    // loop end
    // 1 is empty
    result.label(Comp_list1_empty);
    result.cmpq("%rax", "8(%rsi)");
    result.je(eq);// both are empty
    result.jmp(inf_t); // 2 is longer than 1


    // Beq_Neq
    result.label(Beq_Neq);
    // labels
    String Beq_Neq_bool_int_check = currentFunction.toString() + "_" + currentFunction.tmp++;
    String Beq_Neq_list_check = currentFunction.toString() + "_" + currentFunction.tmp++;

    // check type of v
    result.cmpq(3, "(%rdi)");
    result.jl(Beq_Neq_bool_int_check);
    result.jg(Beq_Neq_list_check);
    // check type of v
    // if v is a string
    result.cmpq(3, "(%rsi)");
    result.jne(inf_t);
    result.jmp(string_operation);
    // if v is a boolean or an int
    result.label(Beq_Neq_bool_int_check);
    result.cmpq(2, "(%rsi)");
    result.jg(inf_t);
    result.jmp(bool_int_operation);
    // if v is a list
    result.label(Beq_Neq_list_check);
    result.cmpq(4, "(%rsi)");
    result.jne(inf_t);

    // do the operation on list
    // internal labels
    String Beq_Neq_list1_empty = currentFunction.toString() + "_" + currentFunction.tmp++;
    String Beq_Neq_loop = currentFunction.toString() + "_" + currentFunction.tmp++;
    // use %rax as a counter
    result.xorq("%rax", "%rax");
    // loop
    result.label(Beq_Neq_loop);
    result.cmpq("%rax", "8(%rdi)");
    result.je(Beq_Neq_list1_empty); // exit if 1 is empty
    // 1 not empty
    result.cmpq("%rax", "8(%rsi)");
    result.je(sup_t); // exit if 2 is empty
    // 1 and 2 not empty
    result.movq("16(%rdi,%rax,8)", "%rdi");
    result.movq("16(%rsi,%rax,8)", "%rsi");
    // compare the elements
    result.pushq("%rax");
    result.movq(0, "%rax");
    result.call(".my_compare");
    // exit loop if the elements are different
    result.cmpq(1, "%rax");
    result.je(inf_t);
    result.jg(sup_t);
    // elements are equal
    result.popq("%rax");
    result.incq("%rax");
    result.jmp(Beq_Neq_loop);
    // loop end
    // 1 is empty
    result.label(Beq_Neq_list1_empty);
    result.cmpq("%rax", "8(%rsi)");
    result.je(eq);// both are empty
    result.jmp(inf_t); // 2 is longer than 1


    // common operations
    // do the operation on int/bool
    result.label(bool_int_operation);
    result.movq("8(%rdi)", "%rdi");
    result.cmpq("%rdi", "8(%rsi)");
    result.je(eq);
    result.jg(sup_t);
    result.jmp(inf_t);

    // do the operation on string
    result.label(string_operation);
    // put the address of the strings in %rdi and %rsi
    result.leaq("16(%rdi)", "%rdi");
    result.leaq("16(%rsi)", "%rsi");
    // call strcmp
    result.call(".my_strcmp");
    // exit
    result.movq("%rbp", "%rsp");
    result.popq("%rbp");
    result.ret();


    // exit
    // 1 == 2
    result.label(eq);
    result.movq(0, "%rax");
    result.movq("%rbp", "%rsp");
    result.popq("%rbp");
    result.ret();
    // 1 < 2
    result.label(inf_t);
    result.movq(-1, "%rax");
    result.movq("%rbp", "%rsp");
    result.popq("%rbp");
    result.ret();
    // 1 > 2
    result.label(sup_t);
    result.movq(1, "%rax");
    result.movq("%rbp", "%rsp");
    result.popq("%rbp");
    result.ret();

    // Restore the stack pointer and return
    return;
  }

  public void visit(TErange e) {
    // TODO
  }
  public void visit(TElist e) {
    // TODO
  }
  public void visit(TEunop e) {
    // TODO
    e.e.accept(this);
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
    Variable v = Variable.mkVariable("#" + currentFunction.tmp++);
    currentFunction.variables.put(v.name, v);
    v.str = -(currentFunction.fixe_stack_size++)*8+"(%rbp)";
    result.subq("$8", "%rsp");

    if (Compile.debug)
      System.out.println("creating tmp " + v.name + " in " + currentFunction.name);

    return v;
  }

  private boolean killTmp(Variable v) {
    if (Compile.debug)
      System.out.println("killing var " + v.name + " in " + currentFunction.name);

    if (v.name.charAt(0) == '#' && currentFunction.memory.containsValue(v))
    {
      String reg = currentFunction.memory.entrySet().stream().filter(entry -> entry.getValue().equals(v)).findFirst().get().getKey();
      currentFunction.memory.remove(reg);
      currentFunction.reg_age.put(reg, -1);
      // TODO : free the allocated memory for the variable ?
      return true;
    }
    else
    {
      if (Compile.debug)
        System.out.println("Warning: trying to kill a non temporary variable : " + v.name);

      return false;
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
    currentFunction.reg_age.put(reg, currentFunction.age++);
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
    currentFunction.reg_age.put(reg, -1);

    if (Compile.debug)
      System.out.println(v.name + " evicted from " + reg);
  }

  private String getReg() {
    // free the oldest used reg
    String oldest = currentFunction.reg_age.entrySet().stream().min(Comparator.comparingInt(Map.Entry::getValue)).get().getKey();

    if (Compile.debug)
      System.out.println("evicting " + oldest + " for temporary use");

    // update the register and memory state
    freeReg(oldest);

    // age the register
    currentFunction.reg_age.put(oldest, currentFunction.age++);
    return oldest;
  }

  private String getRegFor(Variable v) {
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

      if (Compile.debug)
        System.out.println("acces to " + v.name + " with stack access, now buffered in " + oldest);

      // update the register and memory state
      freeReg(oldest);
      loadVar(v, oldest);

      return oldest;
      }
  }

  private void restoreCalleSavedRegisters(Function f) {
    for (Variable v : f.variables.values()) {
      if (v.name.charAt(0) == '%' && f.reg_age.get(v.name) != 0){
        if (Compile.debug) {
          System.out.println("restoring " + v.name);
        }
        result.movq(v.str, v.name);
      }
    }
    // TODO : free the allocated memory for the local variables
  }

  private void implementMalloc() {
    result.label(".my_malloc");
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
    result.call(".my_malloc");

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

    result.call(".my_malloc");// allocate memory for the list

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
    result.label(".my_print");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    result.pushq("%rax");
    result.xorq("%rax","%rax");

    // Generate code for the body of the function
    // TODO
    // faire différents cas en fonction du type en entrée

    // Restore the stack pointer and return
    result.popq("%rax");
    result.addq("$8", "%rsp");
    result.popq("%rbp");
    result.ret();
  }

  private void implementStrcpy() {
    // TODO
  }

  private void implementstrcmp() {
    // TODO
  }

  private void implementErrorGestion() {
    // Error message
    result.dlabel(".Error_message");
    result.string("error : detected error while excecuting code");

    // Reset stack
    result.label(".ErrorGestion");
    result.movq("-8(%rbp)", "%rbp");
    result.movq("%rbp", "%rsp");

    // print error msg
    result.xorq("%rax","%rax");
    result.movq(".Error_message", "%rdi");
    result.call("printf");

    // leave with error code
    result.movq(1,"%rdi");
    result.emit("syscall exit");
    // TODO verifier si cest la bonne typo

  }

}
