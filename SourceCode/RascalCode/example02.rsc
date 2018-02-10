module example02

import IO;
import CheckTypesLocal;

//Util functions to use the CheckTypes
import StaticTestingUtilsLocal;

test bool ok01() = checkOK("3*3;");

test bool ok02() = checkOK("int T=0; (T ? 13) == 13;");

test bool ok03() = checkOK("3*3;");

test bool compError1() = unexpectedType("1 o 3;");
  	
test bool closError11() = unexpectedType("1*;");
 
test bool closError21() = unexpectedType("1+;");

test bool undefined1() = uninitialized("int T; (T ? 13) == 13;");