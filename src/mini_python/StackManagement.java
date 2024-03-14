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
      }
    }
    // TODO : free the allocated memory for the local variables
  }
}
