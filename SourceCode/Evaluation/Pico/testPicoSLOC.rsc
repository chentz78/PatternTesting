module testPicoSLOC

import IO;
import genericSLOC;

public bool testCheck(loc path, str td, value vOracle) {
  int ret = getSLOCLines(path+td);                                      
  println("<td>:<ret>");
  
  switch (vOracle) {
    case int v : return ret == vOracle;
    default : return false;
  }
  
}

test bool t1() = testCheck(|file:///Users/chentz/L/testgeneration-cwi.git/rascal.workfolder/PicoMetric/src/Examples|, "Fac.pico", 16);