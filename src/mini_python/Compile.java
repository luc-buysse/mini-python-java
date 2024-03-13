package mini_python;

import java.util.*;
import java.util.stream.Collectors;


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
      System.out.println("**\ncompilation end\n**");
  }

  public void visit(TDef d) {
    if (Compile.debug){
      System.out.print("compiling " + d.f.name);
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

    // compteurs de labels et variables temporaires (tmp) et compteur d'emplacement de variable dans la stack (stack_size)
    currentFunction.stack_size = 1;// next free space in the stack
    currentFunction.tmp = 0;

    // args
    int i = 0;
    for (Variable v : d.f.params) {

      if (i < 6) {
        v.str = -(currentFunction.stack_size++)*8 + "(%rbp)";
        d.f.memory.put(registers[i+1], v);// i+1 because %rax in register[0]
        d.f.reg_age.put(registers[i+1], currentFunction.age);
      } else {
        v.str = (i-6+3)*8+"(%rbp)"; // 6 pour les 6 premiers args, 3 pour les rbp, rip et global array pointer dans la stack
      }
      i++;
    }

    if (Compile.debug) {
      System.out.print(" (nb params : " + (currentFunction.stack_size - 1));
    }
    int stack_size_buf = currentFunction.stack_size;

    // allocate space for local variables
    for (Variable v : d.f.variables.values()) {
      if (v.str.equals("")) {
        v.str = -(currentFunction.stack_size++)*8+"(%rbp)";
      }
    }

    if (Compile.debug) {
      System.out.println(" ; nb local variables : " + (currentFunction.stack_size-stack_size_buf)+ ")");
    }
    stack_size_buf = currentFunction.stack_size;

    // space for the calle saved registers
    int n = 1/* %rax */ + ((d.f.params.size()>6)?6:d.f.params.size())/* args reg */;
    for (int j = n; j < this.registers.length; j++) {
      Variable v = Variable.mkVariable(registers[j]);
      d.f.variables.put(registers[j],v);
      v.str = -(currentFunction.stack_size++)*8+"(%rbp)";
      currentFunction.memory.put(registers[j], v);// the reg age is already to 0 meaning is not empty but has never been used by the currentFunction
    }

    // update the stack pointer
    result.subq("$"+(currentFunction.stack_size-1)*8, "%rsp");// -1 because the stack_size is the next free space in the stack

    // compile the body
    d.body.accept(this);

    if (Compile.debug) {
      System.out.println(currentFunction.name+".stack_size apres compilation du corps : " + (currentFunction.stack_size-1));
      System.out.println("variables state : "+currentFunction.variables.size()+ " local variables among them "+ (currentFunction.stack_size - stack_size_buf) + " are temporaries");
      HashSet<String> set = new HashSet<>();
      boolean duplicate = false;
      for (Variable var : currentFunction.variables.entrySet().stream().map(entry -> entry.getValue()).collect(Collectors.toList())){
          if (!set.add(var.str)) {
              System.out.println("Duplicate stack location found: " + var.str);
              duplicate = true;
          }
      }
      if (!duplicate)
          System.out.println("No duplicates stack location found");
          System.out.println();
    }

    // restore the calle saved registers
    sM.restoreCalleSavedRegisters(d.f);

    // if main, exit
    if (d.f.name.equals("main")) {
      // flush the printf buffer
      result.andq("$-16", "%rsp");// align the stack pointer
      result.xorq("%rdi", "%rdi");
      result.call("fflush");
      // exit
      result.xorq("%rdi", "%rdi");
      result.movq(60,"%rax");
      result.emit("syscall");
    }
    else {
      // restore the stack pointer and return
      result.movq("%rbp", "%rsp");
      result.popq("%rbp");
      result.ret();
    }
  }
  public void visit(Cnone c) {
    String reg = sM.getRegFor(currentFunction, var);
    result.movq("$_None", reg);

    if (Compile.debug)
    System.out.println(" : (none) in "+var.name);
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
    if (Compile.debug)
      System.out.println(" : (boolean) "+c.b+" in "+var.name);
  }
  public void visit(Cstring c) {
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
    if (Compile.debug)
      System.out.println(" : (string) \""+c.s+"\" in "+var.name);
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
    if (Compile.debug)
      System.out.println(" : (int) "+c.i+" in "+var.name);
  }
  public void visit(TEcst e)  {
    if (Compile.debug)
      System.out.print("compiling " + e.toString());

    e.c.accept(this);
  }
  public void visit(TEbinop e)  {
    Variable v;
    if (Compile.debug)
      System.out.println("compiling "+ e.toString() +" : " + e.op + " of " + e.e1.toString() + " and " + e.e2.toString());

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
          
        // memory management
        sM.freeReg(currentFunction, "%rdi"); currentFunction.reg_age.put("%rdi", currentFunction.age);
        sM.freeReg(currentFunction, "%rsi"); currentFunction.reg_age.put("%rsi", currentFunction.age);
        sM.freeReg(currentFunction, "%rax"); currentFunction.reg_age.put("%rax", currentFunction.age++);
        tmp = sM.getRegFor(currentFunction, v);// arg 2
        tmp2 = sM.getRegFor(currentFunction, var);// arg 1
        // type check
        result.cmpq(2, "("+tmp+")");
        result.je(Badd_int_check);
        result.cmpq(3, "("+tmp+")");
        result.je(Badd_string_check);
        result.cmpq(4, "("+tmp+")");
        result.je(Badd_list_check);
        result.jmp("_Error_gestion");
        // int case
        result.label(Badd_int_check);
        result.cmpq(2, "("+tmp2+")");
        result.je(Badd_int);
        result.jmp("_Error_gestion");
        result.label(Badd_int);
        result.movq("8("+tmp2+")", tmp2);// reuse the register because the variable is not used anymore
        result.addq(tmp2, "8("+tmp+")");// return value in tmp
        result.jmp(Badd_end);
        // string case
        result.label(Badd_string_check);
        result.cmpq(3, "("+tmp2+")");
        result.je(Badd_string);
        result.jmp("_Error_gestion");
        result.label(Badd_string);
        // get the length of the new string to %rsi
        result.movq("8("+ tmp +")", "%rsi");
        result.addq("8("+ tmp2 +")", "%rsi");// get the length of the string to construct
        result.leaq("17(,%rsi,1)", "%rdi");// get the length of the memory to allocate 17 = 2*8 + 1
        result.call("_my_malloc");// allocate memory for the list
        result.movq(3, "(%rax)");// store the type of the list
        result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory
        // fill the allocated memory
        result.leaq("16("+tmp2+")", "%rsi");
        result.leaq("16(%rax)", "%rdi");
        result.movq("%rax", tmp2);// save the address of the new var
        result.call("_my_strcpy");//copy the first string
        result.leaq("16("+tmp+")", "%rsi");
        result.leaq("16("+tmp2+")", "%rdi");
        result.call("_my_strcat");//copy the second string into the allocated memory 
        result.movq(tmp2,tmp);// return value in tmp
        // jump to exit
        result.jmp(Badd_end);
        // list case
        result.label(Badd_list_check);
        result.cmpq(4, "("+tmp2+")");
        result.je(Badd_list);
        result.jmp("_Error_gestion");
        result.label(Badd_list);
        // labels
        String Badd_list_loop_1 = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Badd_list_loop_2 = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Badd_list_skip_1 = currentFunction.toString() + "_" + currentFunction.tmp++;
        String Badd_list_skip_2 = currentFunction.toString() + "_" + currentFunction.tmp++;
        // get the length of the new list to %rsi
        result.movq("8("+ tmp +")", "%rsi");
        result.addq("8("+ tmp2 +")", "%rsi");// get the length of the list to construct
        result.leaq("16(,%rsi,8)", "%rdi");// get the length of the memory to allocate
        result.call("_my_malloc");// allocate memory for the list
        result.movq(4, "(%rax)");// store the type of the list
        result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory
        // first list (tmp2 arg1)
        result.cmpq(0, "8("+ tmp2 +")");
        result.je(Badd_list_skip_1);// if len(list_1) <=0, nothing need to be done
        result.xorq("%rdi", "%rdi");// %rdi = 0
        result.label(Badd_list_loop_1);
        result.movq("16("+tmp2+",%rdi,8)", "%rsi");// store the elements of the list_1 to the allocated memory
        result.movq("%rsi", "16(%rax,%rdi,8)");
        result.incq("%rdi");// increment the counter
        result.cmpq("%rdi", "8("+ tmp2 +")");
        result.jg(Badd_list_loop_1);
        result.label(Badd_list_skip_1);
        // second list
        result.cmpq(0, "8("+ tmp +")");
        result.je(Badd_list_skip_2);// if len(list_2) <=0, nothing need to be done
        result.movq("%rdi", tmp2);// tmp2 is the pointer to the new list memory case to fill
        result.xorq("%rdi", "%rdi");// %rdi = 0
        result.label(Badd_list_loop_2);
        result.movq("16("+tmp+",%rdi,8)", "%rsi");// store the elements of the list_2 to the allocated memory
        result.movq("%rsi", "16(%rax,"+tmp2+",8)");
        result.incq("%rdi");// increment the counter
        result.incq(tmp2);// increment the counter
        result.cmpq("%rdi", "8("+ tmp +")");
        result.jg(Badd_list_loop_2);
        result.label(Badd_list_skip_2);
        // put the output in tmp than jump to exit
        result.movq("%rax",tmp);// return value in tmp
        result.jmp(Badd_end);
        // exit 
        result.label(Badd_end);
        // update memory state
        // result variable in tmp, v and var are not used anymore
        sM.killTmp(currentFunction,var);
        sM.killTmp(currentFunction,v);
        sM.assign(currentFunction, var, tmp);
        currentFunction.reg_age.put("%rdi", -1);
        currentFunction.reg_age.put("%rsi", -1);
        currentFunction.reg_age.put("%rax", -1);
        return;

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
        if (sM.killTmp(currentFunction,v)){
          tmp2 = tmp;// if v is a temporary variable, we can use the same register
          currentFunction.reg_age.put(tmp2, currentFunction.age++);
        }
        else
          tmp2 = sM.getReg(currentFunction);
        String tmp3 = sM.getReg(currentFunction);
        result.movq("8("+ tmp +")", tmp2);
        result.movq("8("+sM.getRegFor(currentFunction, var)+")", tmp3);
        // do the mult and put result in var
        result.imulq(tmp2, tmp3);
        result.movq(tmp3, "8("+sM.getRegFor(currentFunction, var)+")");
        sM.freeReg(currentFunction, tmp2);
        if (Compile.debug) {
          System.out.println("result of the multiplication in "+var.name);
        }
        return;

      case Bdiv :
        // check type of v
        result.cmpq(2, "("+sM.getRegFor(currentFunction, v)+")");
        result.jne("_Error_gestion");
        // check type of var
        result.cmpq(2, "("+sM.getRegFor(currentFunction, var)+")");
        result.jne("_Error_gestion");
        // load the value of var in %rax
        sM.freeReg(currentFunction, "%rax");
        currentFunction.reg_age.put("%rax", currentFunction.age);
        currentFunction.memory.put("%rax", var);
        result.movq("8("+ sM.getRegFor(currentFunction, var) +")", "%rax");
        sM.freeReg(currentFunction, "%rdx");
        // update memory state
        currentFunction.memory.remove("%rax");
        currentFunction.reg_age.put("%rax", currentFunction.age++);
        currentFunction.reg_age.put("%rdx", currentFunction.age);
        // load the value of v in tmp2
        tmp2 = sM.getRegFor(currentFunction, v);
        result.movq("8("+ tmp2 +")", tmp2);
        sM.killTmp(currentFunction,v);
        // do the div and put result in var
        result.cqto();
        result.idivq(tmp2);
        result.movq("%rax", "8("+sM.getRegFor(currentFunction, var)+")");
        return;

      case Bmod :
        // check type of v
        result.cmpq(2, "("+sM.getRegFor(currentFunction, v)+")");
        result.jne("_Error_gestion");
        // check type of var
        result.cmpq(2, "("+sM.getRegFor(currentFunction, var)+")");
        result.jne("_Error_gestion");
        // load the value of var in %rax
        sM.freeReg(currentFunction, "%rax");
        currentFunction.reg_age.put("%rax", currentFunction.age);
        currentFunction.memory.put("%rax", var);
        result.movq("8("+ sM.getRegFor(currentFunction, var) +")", "%rax");
        sM.freeReg(currentFunction, "%rdx");
        // update memory state
        currentFunction.memory.remove("%rax");
        currentFunction.reg_age.put("%rax", currentFunction.age++);
        currentFunction.reg_age.put("%rdx", currentFunction.age);
        // load the value of v in tmp2
        tmp2 = sM.getRegFor(currentFunction, v);
        result.movq("8("+ tmp2 +")", tmp2);
        sM.killTmp(currentFunction,v);
        // do the div and put result in var
        result.cqto();
        result.idivq(tmp2);
        result.movq("%rdx", "8("+sM.getRegFor(currentFunction, var)+")");
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
        result.movq(sM.getRegFor(currentFunction, v), "%rdi");
        // move v in %rsi
        result.movq(sM.getRegFor(currentFunction, var), "%rsi");
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
        if (Compile.debug) {
          System.out.println("False_label : "+False_label);
          System.out.println("end : "+end);
        }
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
        if (Compile.debug) {
          System.out.println("Band_end : "+Band_end);
        }
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
        if (Compile.debug) {
          System.out.println("Bor_end : "+Bor_end);
        }
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
      System.out.println("compiling "+e.toString()+" : range of "+ e.e.toString());
    e.e.accept(this);
    sM.freeReg(currentFunction, "%rdi");
    currentFunction.reg_age.put("%rdi", currentFunction.age++);
    result.movq(sM.getRegFor(currentFunction, var), "%rdi");
    sM.freeReg(currentFunction, sM.getRegFor(currentFunction, var));
    result.call("range");
  }
  public void visit(TElist e) {
    if (Compile.debug)
      System.out.println("compiling "+ e.toString()+" : list from "+e.l);
    // créer une liste a partir d'une liste d'expression
    sM.freeReg(currentFunction, "%rdi"); currentFunction.reg_age.put("%rdi", currentFunction.age);
    sM.freeReg(currentFunction, "%rax"); currentFunction.reg_age.put("%rax", currentFunction.age++);
    String size = sM.getReg(currentFunction);
    // get the length of the new list to %rsi
    result.movq(e.l.size(), size);// get the length of the list to construct
    result.leaq("16(,"+size+",8)", "%rdi");// get the length of the memory to allocate
    result.call("_my_malloc");// allocate memory for the list
    result.movq(4, "(%rax)");// store the type of the list
    result.movq(size, "8(%rax)");// store the length of the list to the allocated memory
    // update memory state
    Variable list = var;
    sM.assign(currentFunction, list, "%rax");
    sM.freeReg(currentFunction, size);
    sM.freeReg(currentFunction, "%rdi");
    // fill the list
    int i = 0;
    for (TExpr expr : e.l) {
      var = sM.createTmp(currentFunction);
      expr.accept(this);
      size = sM.getReg(currentFunction);
      result.movq(i++, size);
      result.movq(sM.getRegFor(currentFunction, var), "16("+sM.getRegFor(currentFunction, list)+","+size+",8)");
      sM.killTmp(currentFunction, var);
      sM.freeReg(currentFunction, size);
    }
    var = list;
  }
  public void visit(TEunop e) {
    if (Compile.debug)
      System.out.println("compiling "+e.toString()+" : "+ e.op + " of " + e.e.toString());

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
        if (Compile.debug) {
          System.out.println("Unot_false : "+Unot_false);
          System.out.println("Unot_end : "+Unot_end);
        }
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

    // labels
    String TEident_none = currentFunction.toString() + "_" + currentFunction.tmp++;
    String TEident_int = currentFunction.toString() + "_" + currentFunction.tmp++;
    String TEident_string = currentFunction.toString() + "_" + currentFunction.tmp++;
    String TEident_list = currentFunction.toString() + "_" + currentFunction.tmp++;
    String TEident_bool = currentFunction.toString() + "_" + currentFunction.tmp++;
    String TEident_end = currentFunction.toString() + "_" + currentFunction.tmp++;
    if (Compile.debug) {
      System.out.println("TEident_none : "+TEident_none);
      System.out.println("TEident_int : "+TEident_int);
      System.out.println("TEident_string : "+TEident_string);
      System.out.println("TEident_list : "+TEident_list);
      System.out.println("TEident_bool : "+TEident_bool);
      System.out.println("TEident_end : "+TEident_end);
    }
    // prep memory
    sM.freeReg(currentFunction, "%rdi"); currentFunction.reg_age.put("%rdi", currentFunction.age);
    sM.freeReg(currentFunction, "%rsi"); currentFunction.reg_age.put("%rsi", currentFunction.age);
    sM.freeReg(currentFunction, "%rax"); currentFunction.reg_age.put("%rax", currentFunction.age++);
    if (currentFunction.memory.containsValue(e.x)) 
      sM.freeReg(currentFunction, sM.getRegFor(currentFunction, e.x));// save the pointer to the variable
    String in = sM.getRegFor(currentFunction, e.x);
    String out = sM.getRegFor(currentFunction, var);
    // check type
    result.cmpq(2, "("+in+")");
    result.je(TEident_int);
    result.cmpq(3, "("+in+")");
    result.je(TEident_string);
    result.cmpq(4, "("+in+")");
    result.je(TEident_list);
    result.cmpq(1, "("+in+")");
    result.je(TEident_bool);
    result.cmpq(0, "("+in+")");
    result.je(TEident_none);
    result.jmp("_Error_gestion");
    // None
    result.label(TEident_none);
    result.movq(in, out);
    result.jmp(TEident_end);
    // int
    result.label(TEident_int);
    result.movq(16, "%rdi");
    result.call("_my_malloc");
    result.movq(2, "(%rax)");
    result.movq("8("+in+")", "%rdi");
    result.movq("%rdi", "8(%rax)");
    result.movq("%rax", out);// save the address of the new var
    result.jmp(TEident_end);
    // bool
    result.label(TEident_bool);
    result.movq(16, "%rdi");
    result.call("_my_malloc");
    result.movq(1, "(%rax)");
    result.movq("8("+in+")", "%rdi");
    result.movq("%rdi", "8(%rax)");
    result.movq("%rax", out);// save the address of the new var
    result.jmp(TEident_end);
    // string
    result.label(TEident_string);
    result.movq("8("+ in +")", "%rsi");// get the length of the new string to %rsi
    result.leaq("17(,%rsi,1)", "%rdi");// get the length of the memory to allocate 17 = 2*8 + 1
    result.call("_my_malloc");// allocate memory for the list
    result.movq(3, "(%rax)");// store the type of the list
    result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory
    // fill the allocated memory
    result.leaq("16("+in+")", "%rsi");
    result.leaq("16(%rax)", "%rdi");
    result.movq("%rax", out);// save the address of the new var
    result.call("_my_strcpy");//copy the string
    result.jmp(TEident_end);
    // list
    result.label(TEident_list);
    // get the length of the new list to %rsi
    result.movq("8("+in+")", "%rsi");// get the length of the list to construct
    result.leaq("16(,%rsi,8)", "%rdi");// get the length of the memory to allocate
    result.call("_my_malloc");// allocate memory for the list
    result.movq(4, "(%rax)");// store the type of the list
    result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory
    // fill the list
    result.xorq("%rdi","%rdi");// counter
    String TEident_list_loop = currentFunction.toString() + "_" + currentFunction.tmp++;
    String TEident_list_end = currentFunction.toString() + "_" + currentFunction.tmp++;
    result.cmpq("%rdi", "8("+in+")");
    result.je(TEident_list_end);
    // loop
    result.label(TEident_list_loop);
    result.movq("16("+in+",%rdi,8)", "%rsi");
    result.movq("%rsi", "16(%rax,%rdi,8)");
    result.incq("%rdi");
    // test loop
    result.cmpq("%rdi", "8("+in+")");
    result.je(TEident_list_end);
    result.jmp(TEident_list_loop);
    // loop end
    result.label(TEident_list_end);
    result.movq("%rax", out);// save the address of the new var
    // exit
    result.label(TEident_end);
    // update memory state
    sM.assign(currentFunction, var, out); 
    sM.freeReg(currentFunction, "%rdi");
    sM.freeReg(currentFunction, "%rsi");
    sM.freeReg(currentFunction, "%rax");

    if (Compile.debug)
    System.out.println("compiling "+e.toString()+" : " + e.x.name + " in " + var.name + " cached in " + out);
  }
  public void visit(TEcall e) {
    if (Compile.debug)
      System.out.println("compiling "+e.toString()+" : call to " + e.f.name + " in " + currentFunction.name);

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
      System.out.println("compiling "+e.toString()+" : get element " + e.e2.toString() + " of " + e.e1.toString());

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
      System.out.println("compiling"+s.toString()+" : if of condition " + s.e.toString() + " with (true) " + s.s1.toString() + " and (false) " + s.s2.toString());
    // labels
    String if_else = currentFunction.toString() + "_" + currentFunction.tmp++;
    String if_end = currentFunction.toString() + "_" + currentFunction.tmp++;
    if (Compile.debug) {
      System.out.println("if_else : "+if_else);
      System.out.println("if_end : "+if_end);
    }
    
    var = sM.createTmp(currentFunction);
    s.e.accept(this);
    result.cmpq(0, "8("+sM.getRegFor(currentFunction, var)+")");
    result.je(if_else);
    s.s1.accept(this);
    result.jmp(if_end);
    result.label(if_else);// TODO : issue with reg allocation
    s.s2.accept(this);
    result.label(if_end);
  }
  public void visit(TSreturn s) {
    if (Compile.debug)
      System.out.println("compiling"+s.toString()+" : return in " + currentFunction.name);

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
      System.out.println("compiling "+s.toString()+" : assignement of " + s.e.toString() + " in "+ s.x.name);

    var = sM.createTmp(currentFunction);// create buffer for the expression
    s.e.accept(this);// get the value of the expression
    sM.assign(currentFunction, s.x, sM.getRegFor(currentFunction, var)); // assign the value to the variable
    sM.killTmp(currentFunction,var);// kill the buffer
  }
  public void visit(TSprint s) {
    // print the value of the expression e
    if (Compile.debug)
      System.out.println("compiling "+s.toString()+" : print of " + s.e.toString());

    var = sM.createTmp(currentFunction);
    s.e.accept(this);
    sM.freeReg(currentFunction, "%rdi");
    sM.freeReg(currentFunction, "%rsi");
    result.xorq("%rsi","%rsi");// second argument of print is 0 to have a \n at the end
    String tmp = sM.getRegFor(currentFunction, var);
    if (!tmp.equals("%rdi"))
      result.movq(sM.getRegFor(currentFunction, var), "%rdi");
    result.call("print");
  }
  public void visit(TSblock s) {
    if (Compile.debug)
      System.out.println("compiling "+s.toString()+" : block of statements :" + s.l.toString());
    for (TStmt statement : s.l) {
      statement.accept(this);
    }
  }
  public void visit(TSfor s) {
    // for x in e do s
    if (Compile.debug)
      System.out.println("compiling "+s.toString()+" : for loop of var "+s.x.name+" iterating on "+ s.e.toString() + " doing "+ s.s.toString());

    // labels
    String TSfor_loop = currentFunction.toString() + "_" + currentFunction.tmp++;
    String TSfor_end = currentFunction.toString() + "_" + currentFunction.tmp++;
    if (Compile.debug) {
      System.out.println("TSfor_loop : "+TSfor_loop);
      System.out.println("TSfor_end : "+TSfor_end);
    }
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
      System.out.println("compiling "+s.toString()+" :  eval of "+ s.e.toString());
    var = sM.createTmp(currentFunction);
    s.e.accept(this);
  }
  public void visit(TSset s) {
    // set the element e2 of a list e1 to a value e3
    if (Compile.debug)
      System.out.println("compiling "+s.toString()+" : set element " + s.e2.toString() + " of " + s.e1.toString() + " to " + s.e3.toString());

    // get the list
    var = sM.createTmp(currentFunction);
    s.e1.accept(this);
    Variable list = var;
    result.cmpq(4, "("+sM.getRegFor(currentFunction, list)+")");
    result.jne("_Error_gestion");
    // get the index
    var = sM.createTmp(currentFunction);
    s.e2.accept(this);
    Variable index = var;
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
