module TestUtil

import IO;
import StaticTestingUtilsLocal;

public bool tcModule(str tcName, str body) {
  println("\n\ttestCase <tcName>\n");
  loc mt = |test-modules:///<tcName>.rsc|;
  makeModule(tcName, body);
  return checkModuleOK(mt);
}

public bool testCase(str tcName, str Exp) {
  println("\n\ttestCase <tcName>\n");
  return checkOK(Exp);
}