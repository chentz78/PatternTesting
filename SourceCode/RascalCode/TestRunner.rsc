@bootstrapParser
@doc{
Synopsis: Test set Runner

Description:  
  
Examples

<listing>
...
</listing>  
}

/*ModName*/
//module TestRunner

import lang::rascal::\syntax::Rascal;
import ParseTree;
import IO;
import List;
import String;

/*ModImport*/
//import ModuleMutator;

str getModuleName((Module) `<Tags _> module <{Name "::"}+ _> :: <Name last> <Import* _> <Body _>`) = "<last>";
str getModuleName((Module) `<Tags _> module <Name last> <Import* _> <Body _>`) = "<last>"; 
default str getModuleName(Module x) { throw "can not find name of <x.header>"; }

public loc genTestSet(loc input) {
  m = parse(#start[Module], input).top;
  mName = "<getModuleName(m)>";
  //println(mName);
  list[str] rsl = [];
  top-down visit(m) {
    case FunctionDeclaration d : {
      if (d has signature && \test() <- d.signature.modifiers.modifiers) {
      //&& "test" in d.signature.modifiers.modifiers
        //println("<d.signature.name>: <d.signature.modifiers.modifiers>, <d>");
        rsl += "<d.signature.name>";
      }
    }
  }
  
  loc fTestSet = input.parent + "<mName>_testSet.txt";
  //println("Starting the test of <mName> ...");
  writeFile(fTestSet, intercalate("\n",rsl) + "\n");
  //println("End");
  return fTestSet;
}

public void runTestSet(loc input){
  /*
  println(input.fragment);
  println(input.parent);
  println(input.extension);
  println(input.file);
  println(input.file[ .. findFirst(input.file, ".")]);
  */
  str mName = input.file[ .. findFirst(input.file, ".")]; 
  loc fTestSet = input.parent + "<mName>_testSet.txt";
  loc fTestSetOut = input.parent + "<mName>_testSet.out";
  list[str] testMet = readFileLines(fTestSet);
  map[str, str] status = ();
  int tcNum=0;
  int tcSucc=0;
  bool ret;
  
  /*TestExec*/
  
  //println(testMet);
  
  for (e <- testMet) {
    println("TestExec <e> : <status[e]>");
  }
  println("---------------");
  println("Total TC: <tcNum>");
  println("Success TC: <tcSucc> (<tcSucc*1.0/tcNum>)");
  println("Fail TC: <tcNum-tcSucc>");
}

void main() {
  loc l1 = |project://TestMetrics/src/ModuleMutator.rsc|;
  genTestSet(l1);
  runTestSet(l1);
}