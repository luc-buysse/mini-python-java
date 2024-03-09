package mini_python;

import java.util.Comparator;
import java.util.Map;

public class StackManagement {
  private final X86_64 result;

  public StackManagement(X86_64 result) {
    this.result = result;
  }

  public Variable createTmp(Function currentFunction) {
    Variable v = Variable.mkVariable("#" + currentFunction.tmp++);
    currentFunction.variables.put(v.name, v);
    v.str = -(currentFunction.fixe_stack_size++)*8+"(%rbp)";
    result.subq("$8", "%rsp");

    if (Compile.debug)
      System.out.println("creating tmp " + v.name + " in " + currentFunction.name);

    return v;
  }

  public boolean killTmp(Function currentFunction, Variable v) {
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

  public void loadVar(Function currentFunction, Variable v, String reg) {
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

  public void freeReg(Function currentFunction, String reg) {
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

  public String getReg(Function currentFunction) {
    // free the oldest used reg
    String oldest = currentFunction.reg_age.entrySet().stream().min(Comparator.comparingInt(Map.Entry::getValue)).get().getKey();

    if (Compile.debug)
      System.out.println("evicting " + oldest + " for temporary use");

    // update the register and memory state
    freeReg(currentFunction, oldest);

    // age the register
    currentFunction.reg_age.put(oldest, currentFunction.age++);
    return oldest;
  }

  public String getRegFor(Function currentFunction, Variable v) {
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
      freeReg(currentFunction, oldest);
      loadVar(currentFunction, v, oldest);

      return oldest;
      }
  }

  public void restoreCalleSavedRegisters(Function currentFunction) {
    for (Variable v : currentFunction.variables.values()) {
      if (v.name.charAt(0) == '%' && currentFunction.reg_age.get(v.name) != 0 && !v.name.equals("%rax")){
        if (Compile.debug) {
          System.out.println("restoring " + v.name);
        }
        result.movq(v.str, v.name);
      }
    }
    // TODO : free the allocated memory for the local variables
  }
}
