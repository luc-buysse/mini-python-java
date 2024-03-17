package mini_python;

import java.util.Comparator;
import java.util.Map;

public class StackManagement {
  private final X86_64 result;
  private final static boolean debug = Compile.debug;

  public StackManagement(X86_64 result) {
    this.result = result;
  }

  public Variable createTmp(Function currentFunction) {
    Variable v = Variable.mkVariable("#" + currentFunction.tmp++);
    currentFunction.variables.put(v.name, v); 
    v.str = -(currentFunction.stack_size++)*8+"(%rbp)";
    result.subq("$8", "%rsp");

    if (debug)
      System.out.println("creating tmp " + v.name + " in " + currentFunction.name+ " stack position : " + v.str);

    return v;
  }

  public Variable createTmp(Function currentFunction, Variable var) {
    // create a temporary variable if needed
    if (var != null && var.name.charAt(0) == '#')
      return var;
    // var wasn't a temporary variable, create one
    return createTmp(currentFunction);
  }

  public Variable createAndAllocate(Function currentFunction, Variable buf) {
    // create a new variable to store the result and allocate it if buf is not a temporary variable
    Variable var = createTmp(currentFunction, buf);// create a new variable to store the result
    if (var != buf){
      freeReg(currentFunction, "%rdi");currentFunction.reg_age.put("%rdi", currentFunction.age);
      freeReg(currentFunction, "%rax");currentFunction.reg_age.put("%rax", currentFunction.age++);
      result.movq("$16", "%rdi");
      result.call("_my_malloc");
      result.movq("%rax", getRegFor(currentFunction, var));
      freeReg(currentFunction, "%rdi");
      freeReg(currentFunction, "%rax");
    }
    return var;
  }

  public Variable copyList(Function currentFunction, Variable list) {
    // create a new list and copy the content of the old one
    Variable copy = createTmp(currentFunction);
    // prep memory
    freeReg(currentFunction, "%rdi"); currentFunction.reg_age.put("%rdi", currentFunction.age);
    freeReg(currentFunction, "%rsi"); currentFunction.reg_age.put("%rsi", currentFunction.age);
    freeReg(currentFunction, "%rax"); currentFunction.reg_age.put("%rax", currentFunction.age++);

    // get the length of the new list to %rsi
    result.movq("8("+getRegFor(currentFunction, list)+")", "%rsi");// get the length of the list to construct
    result.leaq("16(,%rsi,8)", "%rdi");// get the length of the memory to allocate
    result.call("_my_malloc");// allocate memory for the list
    result.movq(4, "(%rax)");// store the type of the list
    result.movq("%rsi", "8(%rax)");// store the length of the list to the allocated memory
    // fill the list
    result.xorq("%rdi","%rdi");// counter
    String TEident_list_loop = currentFunction.toString() + "_" + currentFunction.tmp++;
    String TEident_list_end = currentFunction.toString() + "_" + currentFunction.tmp++;
    result.cmpq("%rdi", "8("+getRegFor(currentFunction, list)+")");
    result.je(TEident_list_end);
    // loop
    result.label(TEident_list_loop);
    result.movq("16("+getRegFor(currentFunction, list)+",%rdi,8)", "%rsi");
    result.movq("%rsi", "16(%rax,%rdi,8)");
    result.incq("%rdi");
    // test loop
    result.cmpq("%rdi", "8("+getRegFor(currentFunction, list)+")");
    result.je(TEident_list_end);
    result.jmp(TEident_list_loop);
    // loop end
    result.label(TEident_list_end);
    assign(currentFunction, copy, "%rax");;// save the address of the new var
    // exit
    // update memory state
    freeReg(currentFunction, "%rdi");
    freeReg(currentFunction, "%rsi");
    return copy;
  }

  public Variable copyBoolInt(Function currentFunction, Variable var) {
    // create a new variable and copy the content of the old one
    Variable copy = createTmp(currentFunction);// 
    freeReg(currentFunction, "%rdi");currentFunction.reg_age.put("%rdi", currentFunction.age);
    freeReg(currentFunction, "%rax");currentFunction.reg_age.put("%rax", currentFunction.age++);
    result.movq("$16", "%rdi");
    result.call("_my_malloc");
    assign(currentFunction, copy, "%rax");
    freeReg(currentFunction, "%rdi");
    String buff_reg = getReg(currentFunction);
    result.movq("("+getRegFor(currentFunction, var)+")", buff_reg);
    result.movq(buff_reg, "("+getRegFor(currentFunction, copy)+")");
    result.movq("8("+getRegFor(currentFunction, var)+")", buff_reg);
    result.movq(buff_reg, "8("+getRegFor(currentFunction, copy)+")");
    freeReg(currentFunction, buff_reg);
    return copy;
  }

  public boolean killTmp(Function currentFunction, Variable v) {
    if (debug)
      System.out.println("killing var " + v.name + " in " + currentFunction.name);

    if (v.name.charAt(0) == '#' && currentFunction.memory.containsValue(v))
    {
      String reg = currentFunction.memory.entrySet().stream().filter(entry -> entry.getValue().equals(v)).findFirst().get().getKey();
      currentFunction.memory.remove(reg);
      currentFunction.reg_age.put(reg, -1);
      return true;
    }
    else
    {
      if (v.name.charAt(0) != '#' &&debug)
        System.out.println("Warning: trying to kill a non temporary variable : " + v.name);

      return false;
    }
  }

  public void assign(Function currentFunction, Variable v, String reg) {
    // assign the variable to the register
    if (debug)
      System.out.println("assigning " + v.name + " to " + reg);
    if (currentFunction.memory.containsValue(v)){
      freeReg(currentFunction, currentFunction.memory.entrySet().stream().filter(entry -> entry.getValue().equals(v)).findFirst().get().getKey());
    }
    currentFunction.memory.put(reg,v);
    currentFunction.reg_age.put(reg,currentFunction.age++);
  }

  public void loadVar(Function currentFunction, Variable v, String reg) {
    // load the variable in the register and erase the previous variable in the register
    if (currentFunction.memory.containsValue(v)){
      String old_reg = currentFunction.memory.entrySet().stream().filter(entry -> entry.getValue().equals(v)).findFirst().get().getKey();
      if (old_reg.equals(reg))
        return;
      result.movq(old_reg, reg);// move the variable to the new register
      freeReg(currentFunction, old_reg);
      if (debug)
        System.out.println("moving " + v.name + " from " + old_reg + " to " + reg);
    } else {
      if (currentFunction.variables.containsValue(v)) 
        {// local variable
          result.movq(v.str, reg);
          if (debug)
            System.out.println("loading local " + v.name + " in " + reg);
        }
        else
        {// global variable
          if (debug)
            System.out.println("loading global " + v.name + " in " + reg);
          result.pushq("%rbp");
          result.movq("-8(%rbp)", "%rbp");
          result.movq(v.str, reg);
          result.popq("%rbp");
        }
    }
    // update the memory
    currentFunction.memory.put(reg, v);
    currentFunction.reg_age.put(reg, currentFunction.age++);
  }

  public void freeReg(Function currentFunction, String reg) {
    // free the reg by saving the variable in the stack
    if (debug)
      System.out.println("freeing " + reg + " aged " + currentFunction.reg_age.get(reg) + " in " + currentFunction.name);

    // already free
    if (currentFunction.reg_age.get(reg) == -1 )
      return;
    // tmp register
    if (!currentFunction.memory.containsKey(reg))
    {
      if (debug)
        System.out.println(reg + " was a tempory register");

      currentFunction.reg_age.put(reg, -1);
      return;
    }
    // register containing a variable
    Variable v = currentFunction.memory.get(reg);
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

    if (debug)
      System.out.println(v.name + " evicted from " + reg);
  }

  public String getReg(Function currentFunction) {
    // free the oldest used reg
    String oldest = currentFunction.reg_age.entrySet().stream().min(Comparator.comparingInt(Map.Entry::getValue)).get().getKey();

    // update the register and memory state
    freeReg(currentFunction, oldest);

    // age the register
    currentFunction.reg_age.put(oldest, currentFunction.age++);
    return oldest;
  }

  public String getRegFor(Function currentFunction, Variable v) {
    if (currentFunction.memory.containsValue(v)) { // no eviction
      // get the register
      String reg = currentFunction.memory.entrySet().stream().filter(entry -> entry.getValue().equals(v)).findFirst().get().getKey();

      if (debug)
        System.out.println("acces to " + v.name + " in "+ reg +" without stack access");

      // age the registers
      currentFunction.reg_age.put(reg, currentFunction.age++);

      return reg;
    } else {//eviction
      // get the oldest register
      String oldest = currentFunction.reg_age.entrySet().stream().min(Comparator.comparingInt(Map.Entry::getValue)).get().getKey();

      if (debug)
        System.out.println("acces to " + v.name + " with stack access, now buffered in " + oldest);

      // update the register and memory state
      freeReg(currentFunction, oldest);
      loadVar(currentFunction, v, oldest);

      return oldest;
      }
  }

  public void restoreCalleSavedRegisters(Function currentFunction) {
    for (Variable v : currentFunction.variables.values()) {
      if (debug)
        System.out.println("checking if " + v.name + " need to be restored");
      if (v.name.charAt(0) == '%' && currentFunction.reg_age.get(v.name) != 0 && !v.name.equals("%rax")){
        if (debug) {
          System.out.println("restoring " + v.name);
        }
        result.movq(v.str, v.name);
        currentFunction.memory.put(v.name, v);
        currentFunction.reg_age.put(v.name, currentFunction.age++);
      }
    }
    // TODO : free the allocated memory for the local variables
  }

  public Branching startBranching(Function currentFunction, Variable var, String counterBranchLabel) {
    // create a new function for the branching
    Function newFunction = currentFunction.copy();
    return new Branching(counterBranchLabel, newFunction, var);
  }

  public void mergeMemories(Function currentFunction, Variable var, Branching br) {
    // I assume that the stack is fine and will just merge the memories and reg_age
    if (debug)
      System.out.println("merging " + currentFunction.name + " and " + br.savedFunction.name);

    String skip = "skip_"+currentFunction.name+"_"+currentFunction.tmp++;
    // hypothetical branch
    if (var != null && var.name.charAt(0) != '#') {// persistente variable : create a new tmp one and copy the value
      Variable new_var = createAndAllocate(currentFunction, var);
      if (debug)
        System.out.println("creating a new tmp for " + var.name +" : "+new_var.name);
      String tmp_reg = getReg(currentFunction);
      result.movq("("+getRegFor(currentFunction, var)+")", tmp_reg);
      result.movq(tmp_reg, "("+getRegFor(currentFunction, new_var)+")");
      result.movq("8("+getRegFor(currentFunction, var)+")", tmp_reg);
      result.movq(tmp_reg, "8("+getRegFor(currentFunction, new_var)+")");
      freeReg(currentFunction, tmp_reg);
      var = new_var;
    }
    // end of hypothetical branch

    result.jmp(skip);
    int time_laps = currentFunction.age - br.savedFunction.age;
    int stack_laps = currentFunction.stack_size - br.savedFunction.stack_size;
    result.label(br.counterBranchLabel);
    // counterbranch
    // merge stack allocation
    result.subq("$"+(stack_laps*8), "%rsp");// update the stack pointer
    // merge result var
    if (br.savedVar != null && !var.equals(br.savedVar) ) {
      result.movq(getRegFor(br.savedFunction, br.savedVar), getRegFor(currentFunction, var));
      br.savedFunction.memory.put(getRegFor(br.savedFunction, br.savedVar), var);
      br.savedFunction.variables.put(br.savedVar.name, var);
      
    }
    br.savedVar = var;// update the result var in any case
    // merge regs
    for (Map.Entry<String, Variable> entry : currentFunction.memory.entrySet()) {// for each variable in the current function
      String new_reg = entry.getKey();
      Variable v = entry.getValue();
      if (!br.savedFunction.memory.containsValue(v)) {
        freeReg(br.savedFunction, new_reg);// free the register
        if (br.savedFunction.variables.containsValue(v))
          loadVar(br.savedFunction, v, new_reg);// load the variable in the register
        // variable doesn't exist in the other branch : no need to do anything and may cause a segfault later
      } else {
        String old_reg = br.savedFunction.memory.entrySet().stream().filter(e -> e.getValue().equals(v)).findFirst().get().getKey();
        if (!old_reg.equals(new_reg)) {
          // the variable is in different registers in both branches
          freeReg(br.savedFunction, new_reg);// free the register
          loadVar(br.savedFunction, v, new_reg);// load the variable in the register
          br.savedFunction.reg_age.put(new_reg, currentFunction.reg_age.get(new_reg) - time_laps);
        }// else the variable is in the same register in both branches : nothing to do
      }
    }
    for (Map.Entry<String, Integer> entry : currentFunction.reg_age.entrySet()) {// for each empty register in the current function
      String reg = entry.getKey();
      if (entry.getValue() < 0)
        freeReg(br.savedFunction, reg);
    }

    result.label(skip);
    // the two branchs are merged
  }
}

class Branching {
  public String counterBranchLabel;
  public Function savedFunction;
  public Variable savedVar;

  public Branching(String counterBranchLabel, Function savedFunction, Variable savedVar) {
    this.counterBranchLabel = counterBranchLabel;
    this.savedFunction = savedFunction;
    this.savedVar = savedVar;
  }
}
