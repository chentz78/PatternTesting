module testPicoCalcCC

import IO;
import mainCC;

public bool testCC(loc path, str td, value vOracle) {
  int cc = calcCCP(path+td);
  println("<td>:<cc>");
  
  switch (vOracle) {
    case int v : return cc == vOracle;
    default : return false;
  }
  
}