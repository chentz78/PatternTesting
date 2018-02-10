module example01

import IO;
import CheckTypesLocal;

//Used by the pathconfig function
import util::Reflective;

//Used by the Assignable symbol
import lang::rascal::\syntax::Rascal;

//Util functions to use the CheckTypes
import StaticTestingUtilsLocal;

void main() {
  println("Loaded OK!");
  PathConfig pcfg = pathConfig(srcs=[|test-modules:///|, |std:///|], bin=|home:///c1bin|, libs=[|home:///c1bin|]);
  //PathConfig pcfg = pathConfig(srcs=[|test-modules:///|, |std:///|], bin=|home:///bin|, libs=[|home:///bin|]);
  Configuration c = newConfiguration(pcfg);
  println("Created a new configuration.");
  Assignable ar = (Assignable) `x`;
  println("Created an assignable.");
  //Assignable ar = (Assignable) `x`;
  //buildAssignableTree(ar, true, c);
  println(unexpectedType("3 * true;")); //OK
  //println(unexpectedType("3 * 3;")); //error
  
  println(checkOK("3*3;"));
  println("Everything is OK");
}

test bool ok01() = checkOK("3*3;");

test bool ok02() = checkOK("int T=0; (T ? 13) == 13;");

test bool ok03() = checkOK("3*3;");

test bool compError1() = unexpectedType("1 o 3;");
  	
test bool closError11() = unexpectedType("1*;");
 
test bool closError21() = unexpectedType("1+;");

test bool undefined1() = uninitialized("int T; (T ? 13) == 13;");