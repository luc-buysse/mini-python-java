package mini_python;

public class Implement {
  private final X86_64 result;
  private final Function currentFunction;
  private final static boolean debug = false;

  public Implement(X86_64 result, Function mainFu) {
    this.result = result;
    this.currentFunction = new Function("_implement_context",mainFu);
  }
  
  public void malloc() {
    result.label("_my_malloc");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    // caller save registers
    result.pushq("%rsi");
    result.pushq("%rdx");
    result.pushq("%rcx");
    result.pushq("%r8");
    result.pushq("%r9");
    result.pushq("%r10");
    result.pushq("%r11");

    result.pushq("%rbx");
    result.movq("%rsp", "%rbx");
    result.andq("$-16", "%rsp");

    result.call("malloc");

    result.movq("%rbx", "%rsp");
    result.popq("%rbx");

    // caller restore registers
    result.popq("%r11");
    result.popq("%r10");
    result.popq("%r9");
    result.popq("%r8");
    result.popq("%rcx");
    result.popq("%rdx");
    result.popq("%rsi");

    result.movq("%rbp", "%rsp");
    result.popq("%rbp");
    result.ret();
    
  }

  public void len() {
    result.label("len");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    // calle save used registers
    result.pushq("%rsi");
    result.movq("8(%rdi)", "%rsi");// get the length of the list

    // Set up args
    result.movq(16, "%rdi");

    // allocate memory for len of the list
    result.call("_my_malloc");

    // set up return value
    result.movq(2, "(%rax)");
    result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory

    // calle restore used registers
    result.popq("%rsi");

    // Restore the stack pointer and return
    result.popq("%rbp");
    result.ret();
  }

  public void list() {
    result.label("list");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    // calle save used registers
    result.pushq("%rsi");

    // Generate code for the body of the function
    result.movq("8(%rdi)", "%rsi");// get the length of the list to construct
    result.leaq("16(,%rsi,8)", "%rdi");// get the length of the memory to allocate

    result.call("_my_malloc");// allocate memory for the list

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

  public void range() {
    result.label("range");
    result.ret();// list does everything
  }

  public void print() {// print the value of %rdi and put a new line at the end if %rsi is 0
    result.label("print");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    // caller save used registers
    result.pushq("%rax");
    result.pushq("%rdx");
    result.pushq("%rcx");
    result.pushq("%r8");
    result.pushq("%r9");
    result.pushq("%r10");
    result.pushq("%r11");
    // save %rsi in %r12
    result.pushq("%r12");
    result.pushq("%r13");
    result.pushq("%r14");
    result.movq("%rsi", "%r12");

    // aligne the stack for the call of printf
    result.pushq("%rbx");
    result.movq("%rsp", "%rbx");
    result.andq("$-16", "%rsp");

    // put 0 in %rax for futur use of printf
    result.xorq("%rax", "%rax");

    // label for type check
    String print_int = currentFunction.toString() + "_" + currentFunction.tmp++;
    String print_bool = currentFunction.toString() + "_" + currentFunction.tmp++;
    String print_string = currentFunction.toString() + "_" + currentFunction.tmp++;
    String print_list = currentFunction.toString() + "_" + currentFunction.tmp++;
    String print_none = currentFunction.toString() + "_" + currentFunction.tmp++;
    String print_end = currentFunction.toString() + "_" + currentFunction.tmp++;
    String print_skip = currentFunction.toString() + "_" + currentFunction.tmp++;

    // check type of %rdi
    result.cmpq(0, "(%rdi)");
    result.je(print_none);
    result.cmpq(1, "(%rdi)");
    result.je(print_bool);
    result.cmpq(2, "(%rdi)");
    result.je(print_int);
    result.cmpq(3, "(%rdi)");
    result.je(print_string);
    result.cmpq(4, "(%rdi)");
    result.je(print_list);
    result.jmp("_Error_gestion");

    // print bool
    result.label(print_bool);
    print_bool();
    result.jmp(print_end);
    // print int
    result.label(print_int);
    print_int();
    result.jmp(print_end);
    // print string
    result.label(print_string);
    print_string();
    result.jmp(print_end);
    // print list
    result.label(print_list);
    print_list();
    result.jmp(print_end);
    // print none
    result.label(print_none);
    print_none();

    // exit
    result.label(print_end);

    //flush the buffer if %r12 is 0
    result.cmpq(0, "%r12");
    result.jne(print_skip);
    result.xorq("%rax", "%rax");
    result.movq("$_flush", "%rdi");
    result.dlabel("_flush");
    result.data(".string \"\\n\"");

    result.call("printf");

    result.label(print_skip);
    // realign the stack and return
    result.movq("%rbx", "%rsp");
    result.popq("%rbx");

    result.popq("%r14");
    result.popq("%r13");
    result.popq("%r12");
    // restore used registers
    result.popq("%r11");
    result.popq("%r10");
    result.popq("%r9");
    result.popq("%r8");
    result.popq("%rcx");
    result.popq("%rdx");
    result.popq("%rax");

    // Restore the stack pointer and return
    result.popq("%rbp");
    result.ret();
  }

  private void print_bool() {
    String print_false = currentFunction.toString() + "_" + currentFunction.tmp++;
    String print_end = currentFunction.toString() + "_" + currentFunction.tmp++;
    // print the boolean
    result.cmpq(0, "8(%rdi)");
    result.je(print_false);
    // print true
    result.movq("$_True", "%rdi");
    result.call("printf");
    result.jmp(print_end);
    // print false
    result.label(print_false);
    result.movq("$_False", "%rdi");
    result.call("printf");
    // exit
    result.label(print_end);

    // create the string for the booleans
    result.dlabel("_True");
    result.string("True");
    result.dlabel("_False");
    result.string("False");
  }

  private void print_int() {
    // print the integer
    result.movq("8(%rdi)", "%rsi");
    result.movq("$_int_format", "%rdi");
    result.call("printf");

    // create the string for the int format
    result.dlabel("_int_format");
    result.string("%d");
  }

  private void print_string() {
    // print the string
    result.leaq("16(%rdi)", "%rdi");
    result.call("printf");
  }

  private void print_list() {
    // print the list
    result.movq("8(%rdi)", "%r13"); // buffer the length of the list
    result.leaq("16(%rdi)", "%r14"); // buffer the address of the first element of the list
    // print the start of the list
    result.movq("$_list_format_start", "%rdi");
    result.call("printf");
    // loop to print the elements of the list
    String print_list_loop = currentFunction.toString() + "_" + currentFunction.tmp++;
    String print_list_end = currentFunction.toString() + "_" + currentFunction.tmp++;
    // 1st passage to print the 1st element without separator
    result.cmpq(0, "%r13");
    result.je(print_list_end);
    result.movq("(%r14)", "%rdi");// element
    result.movq(1,"%rsi");
    result.call("print");
    result.decq("%r13");// count
    result.leaq("8(%r14)","%r14");
    // loop to print the other elements with separator
    result.cmpq(0, "%r13");
    result.je(print_list_end);
    result.label(print_list_loop);
    result.movq("$_list_format_sep", "%rdi");// separator
    result.xorq("%rax","%rax");
    result.call("printf");
    result.movq("(%r14)", "%rdi");// element
    result.movq(1,"%rsi");
    result.call("print");
    result.decq("%r13");// count
    result.leaq("8(%r14)","%r14");
    result.cmpq(0, "%r13");
    result.jg(print_list_loop);
    result.label(print_list_end);
    // print the end of the list
    result.movq("$_list_format_end", "%rdi");
    result.call("printf");

    // create the string for the list format
    result.dlabel("_list_format_start");
    result.string("[");
    result.dlabel("_list_format_end");
    result.string("]");
    result.dlabel("_list_format_sep");
    result.string(", ");
  }

  private void print_none() {
    // print the none
    result.movq("$_None_format", "%rdi");
    result.call("printf");

    // create the string for the none
    result.dlabel("_None_format");
    result.string("None");
  }

  public void strcpy() {
    result.label("_my_strcpy");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    // calle save used registers
    result.pushq("%rax");
    result.pushq("%rdx");
    result.pushq("%rcx");
    result.pushq("%r8");
    result.pushq("%r9");
    result.pushq("%r10");
    result.pushq("%r11");
    // aligne the stack and call
    result.pushq("%rbx");
    result.movq("%rsp", "%rbx");
    result.andq("$-16", "%rsp");

    result.call("strcpy");

    result.movq("%rbx", "%rsp");
    result.popq("%rbx");

    // calle restore used registers
    result.popq("%r11");
    result.popq("%r10");
    result.popq("%r9");
    result.popq("%r8");
    result.popq("%rcx");
    result.popq("%rdx");
    result.popq("%rax");

    // Restore the stack pointer and return
    result.popq("%rbp");
    result.ret();
  }

  public void strcat() {
    result.label("_my_strcat");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    // calle save used registers
    result.pushq("%rax");
    result.pushq("%rdx");
    result.pushq("%rcx");
    result.pushq("%r8");
    result.pushq("%r9");
    result.pushq("%r10");
    result.pushq("%r11");

    // aligne the stack and call
    result.pushq("%rbx");
    result.movq("%rsp", "%rbx");
    result.andq("$-16", "%rsp");

    result.call("strcat");

    result.movq("%rbx", "%rsp");
    result.popq("%rbx");

    // calle restore used registers
    result.popq("%r11");
    result.popq("%r10");
    result.popq("%r9");
    result.popq("%r8");
    result.popq("%rcx");
    result.popq("%rdx");
    result.popq("%rax");

    // Restore the stack pointer and return
    result.popq("%rbp");
    result.ret();
  }

  public void strcmp() {
    result.label("_my_strcmp");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    // calle save used registers
    result.pushq("%rdx");
    result.pushq("%rcx");
    result.pushq("%r8");
    result.pushq("%r9");
    result.pushq("%r10");
    result.pushq("%r11");
    // aligne the stack and call
    result.pushq("%rbx");
    result.movq("%rsp", "%rbx");
    result.andq("$-16", "%rsp");

    result.call("strcmp");

    result.movq("%rbx", "%rsp");
    result.popq("%rbx");

    // calle restore used registers
    result.popq("%r11");
    result.popq("%r10");
    result.popq("%r9");
    result.popq("%r8");
    result.popq("%rcx");
    result.popq("%rdx");

    // Restore the stack pointer and return
    result.popq("%rbp");
    result.ret();
  }

  public void errorGestion() {
    // Error message
    result.dlabel("_Error_message");
    result.string("error : detected error while excecuting code\\n");

    // Reset stack
    result.label("_Error_gestion");

    // print error msg
    result.xorq("%rax","%rax");
    result.movq("$_Error_message", "%rdi");
    // align the stack and call
    result.andq("$-16", "%rsp");
    result.call("printf");
    // flush the buffer
    result.xorq("%rdi", "%rdi");
    result.call("fflush");

    // leave with error code
    result.movq(1,"%rdi");
    result.movq(60,"%rax");
    result.emit("syscall");
  }

  public void compare() {
    // compare %rdi and %rsi and put the result in %rax ( 0 if equal, -1 if %rdi < %rsi, 1 if %rdi > %rsi )
    result.label("_my_compare");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    if (debug)
      System.out.println("compiling .my_compare in " + currentFunction.name);

    // check the type of the variables aren't None
    result.cmpq(0, "(%rdi)");
    result.je("_Error_gestion");
    result.cmpq(0, "(%rsi)");
    result.je("_Error_gestion");

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
    result.jne("_Error_gestion");
    result.jmp(string_operation);
    // if v is a boolean or an int
    result.label(Comp_bool_int_check);
    result.cmpq(2, "(%rsi)");
    result.jg("_Error_gestion");
    result.jmp(bool_int_operation);
    // if v is a list
    result.label(Comp_list_check);
    result.cmpq(4, "(%rsi)");
    result.jne("_Error_gestion");

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
    result.call("_my_compare");
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
    result.call("_my_compare");
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
    result.call("_my_strcmp");
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
}
