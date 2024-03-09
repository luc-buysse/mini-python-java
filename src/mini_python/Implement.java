package mini_python;

public class Implement {
  private final X86_64 result;
  private final Function currentFunction;

  public Implement(X86_64 result, Function mainFu) {
    this.result = result;
    this.currentFunction = new Function(".implement_context",mainFu);
  }
  
  public void malloc() {
    result.label(".my_malloc");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");
    result.andq("$-16", "%rsp");// 16-byte stack alignment

    // caller save registers
    result.pushq("%rsi");
    result.pushq("%rdx");
    result.pushq("%rcx");
    result.pushq("%r8");
    result.pushq("%r9");
    result.pushq("%r10");
    result.pushq("%r11");

    result.call("malloc");

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

  public void list() {
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

  public void range() {
    result.label("range");
    result.ret();// list does everything
  }

  public void print() {
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

  public void strcpy() {
    result.label(".my_strcpy");
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

    result.call("strcpy");

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
    result.label(".my_strcat");
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

    result.call("strcat");

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
    result.label(".my_strcmp");
    result.pushq("%rbp");
    result.movq("%rsp", "%rbp");

    // calle save used registers
    result.pushq("%rdx");
    result.pushq("%rcx");
    result.pushq("%r8");
    result.pushq("%r9");
    result.pushq("%r10");
    result.pushq("%r11");

    result.call("strcmp");

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


  public void compare() {
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

}
