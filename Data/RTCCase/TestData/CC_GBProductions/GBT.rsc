module GBT

import IO;
import StaticTestingUtilsLocal;

bool tMNOK(loc m) {
  if (!exists(m)) {
    println("tMNOK: Invalid file! <m> ");
    return false;
  }
  
  try {
    if (checkModuleOK(m) ) return false;
  } 
  catch IO(_) : { return false; }
  catch e : { return true; }
  return true;
}

test bool tcN1() = tMNOK(|cwd:///RascalGBT/N1.rsc|);
test bool tcN10() = tMNOK(|cwd:///RascalGBT/N10.rsc|);
test bool tcN100() = tMNOK(|cwd:///RascalGBT/N100.rsc|);
test bool tcN101() = tMNOK(|cwd:///RascalGBT/N101.rsc|);
test bool tcN102() = tMNOK(|cwd:///RascalGBT/N102.rsc|);
test bool tcN103() = tMNOK(|cwd:///RascalGBT/N103.rsc|);
test bool tcN104() = tMNOK(|cwd:///RascalGBT/N104.rsc|);
test bool tcN105() = tMNOK(|cwd:///RascalGBT/N105.rsc|);
test bool tcN106() = tMNOK(|cwd:///RascalGBT/N106.rsc|);
test bool tcN107() = tMNOK(|cwd:///RascalGBT/N107.rsc|);
test bool tcN108() = tMNOK(|cwd:///RascalGBT/N108.rsc|);
test bool tcN109() = tMNOK(|cwd:///RascalGBT/N109.rsc|);
test bool tcN11() = tMNOK(|cwd:///RascalGBT/N11.rsc|);
test bool tcN110() = tMNOK(|cwd:///RascalGBT/N110.rsc|);
test bool tcN111() = tMNOK(|cwd:///RascalGBT/N111.rsc|);
test bool tcN112() = tMNOK(|cwd:///RascalGBT/N112.rsc|);
test bool tcN113() = tMNOK(|cwd:///RascalGBT/N113.rsc|);
test bool tcN114() = tMNOK(|cwd:///RascalGBT/N114.rsc|);
test bool tcN118() = tMNOK(|cwd:///RascalGBT/N118.rsc|);
test bool tcN119() = tMNOK(|cwd:///RascalGBT/N119.rsc|);
test bool tcN12() = tMNOK(|cwd:///RascalGBT/N12.rsc|);
test bool tcN120() = tMNOK(|cwd:///RascalGBT/N120.rsc|);
test bool tcN121() = tMNOK(|cwd:///RascalGBT/N121.rsc|);
test bool tcN122() = tMNOK(|cwd:///RascalGBT/N122.rsc|);
test bool tcN123() = tMNOK(|cwd:///RascalGBT/N123.rsc|);
test bool tcN124() = tMNOK(|cwd:///RascalGBT/N124.rsc|);
test bool tcN125() = tMNOK(|cwd:///RascalGBT/N125.rsc|);
test bool tcN126() = tMNOK(|cwd:///RascalGBT/N126.rsc|);
test bool tcN127() = tMNOK(|cwd:///RascalGBT/N127.rsc|);
test bool tcN128() = tMNOK(|cwd:///RascalGBT/N128.rsc|);
test bool tcN129() = tMNOK(|cwd:///RascalGBT/N129.rsc|);
test bool tcN13() = tMNOK(|cwd:///RascalGBT/N13.rsc|);
test bool tcN130() = tMNOK(|cwd:///RascalGBT/N130.rsc|);
test bool tcN14() = tMNOK(|cwd:///RascalGBT/N14.rsc|);
test bool tcN15() = tMNOK(|cwd:///RascalGBT/N15.rsc|);
test bool tcN16() = tMNOK(|cwd:///RascalGBT/N16.rsc|);
test bool tcN17() = tMNOK(|cwd:///RascalGBT/N17.rsc|);
test bool tcN18() = tMNOK(|cwd:///RascalGBT/N18.rsc|);
test bool tcN19() = tMNOK(|cwd:///RascalGBT/N19.rsc|);
test bool tcN2() = tMNOK(|cwd:///RascalGBT/N2.rsc|);
test bool tcN20() = tMNOK(|cwd:///RascalGBT/N20.rsc|);
test bool tcN21() = tMNOK(|cwd:///RascalGBT/N21.rsc|);
test bool tcN22() = tMNOK(|cwd:///RascalGBT/N22.rsc|);
test bool tcN23() = tMNOK(|cwd:///RascalGBT/N23.rsc|);
test bool tcN24() = tMNOK(|cwd:///RascalGBT/N24.rsc|);
test bool tcN26() = tMNOK(|cwd:///RascalGBT/N26.rsc|);
test bool tcN27() = tMNOK(|cwd:///RascalGBT/N27.rsc|);
test bool tcN28() = tMNOK(|cwd:///RascalGBT/N28.rsc|);
test bool tcN29() = tMNOK(|cwd:///RascalGBT/N29.rsc|);
test bool tcN3() = tMNOK(|cwd:///RascalGBT/N3.rsc|);
test bool tcN30() = tMNOK(|cwd:///RascalGBT/N30.rsc|);
test bool tcN31() = tMNOK(|cwd:///RascalGBT/N31.rsc|);
test bool tcN32() = tMNOK(|cwd:///RascalGBT/N32.rsc|);
test bool tcN33() = tMNOK(|cwd:///RascalGBT/N33.rsc|);
test bool tcN34() = tMNOK(|cwd:///RascalGBT/N34.rsc|);
test bool tcN35() = tMNOK(|cwd:///RascalGBT/N35.rsc|);
test bool tcN36() = tMNOK(|cwd:///RascalGBT/N36.rsc|);
test bool tcN37() = tMNOK(|cwd:///RascalGBT/N37.rsc|);
test bool tcN38() = tMNOK(|cwd:///RascalGBT/N38.rsc|);
test bool tcN39() = tMNOK(|cwd:///RascalGBT/N39.rsc|);
test bool tcN4() = tMNOK(|cwd:///RascalGBT/N4.rsc|);
test bool tcN40() = tMNOK(|cwd:///RascalGBT/N40.rsc|);
test bool tcN41() = tMNOK(|cwd:///RascalGBT/N41.rsc|);
test bool tcN42() = tMNOK(|cwd:///RascalGBT/N42.rsc|);
test bool tcN43() = tMNOK(|cwd:///RascalGBT/N43.rsc|);
test bool tcN44() = tMNOK(|cwd:///RascalGBT/N44.rsc|);
test bool tcN45() = tMNOK(|cwd:///RascalGBT/N45.rsc|);
test bool tcN46() = tMNOK(|cwd:///RascalGBT/N46.rsc|);
test bool tcN47() = tMNOK(|cwd:///RascalGBT/N47.rsc|);
test bool tcN48() = tMNOK(|cwd:///RascalGBT/N48.rsc|);
test bool tcN49() = tMNOK(|cwd:///RascalGBT/N49.rsc|);
test bool tcN50() = tMNOK(|cwd:///RascalGBT/N50.rsc|);
test bool tcN51() = tMNOK(|cwd:///RascalGBT/N51.rsc|);
test bool tcN52() = tMNOK(|cwd:///RascalGBT/N52.rsc|);
test bool tcN53() = tMNOK(|cwd:///RascalGBT/N53.rsc|);
test bool tcN54() = tMNOK(|cwd:///RascalGBT/N54.rsc|);
test bool tcN55() = tMNOK(|cwd:///RascalGBT/N55.rsc|);
test bool tcN57() = tMNOK(|cwd:///RascalGBT/N57.rsc|);
test bool tcN59() = tMNOK(|cwd:///RascalGBT/N59.rsc|);
test bool tcN60() = tMNOK(|cwd:///RascalGBT/N60.rsc|);
test bool tcN61() = tMNOK(|cwd:///RascalGBT/N61.rsc|);
test bool tcN62() = tMNOK(|cwd:///RascalGBT/N62.rsc|);
test bool tcN63() = tMNOK(|cwd:///RascalGBT/N63.rsc|);
test bool tcN64() = tMNOK(|cwd:///RascalGBT/N64.rsc|);
test bool tcN65() = tMNOK(|cwd:///RascalGBT/N65.rsc|);
test bool tcN66() = tMNOK(|cwd:///RascalGBT/N66.rsc|);
test bool tcN67() = tMNOK(|cwd:///RascalGBT/N67.rsc|);
test bool tcN68() = tMNOK(|cwd:///RascalGBT/N68.rsc|);
test bool tcN69() = tMNOK(|cwd:///RascalGBT/N69.rsc|);
test bool tcN7() = tMNOK(|cwd:///RascalGBT/N7.rsc|);
test bool tcN70() = tMNOK(|cwd:///RascalGBT/N70.rsc|);
test bool tcN71() = tMNOK(|cwd:///RascalGBT/N71.rsc|);
test bool tcN72() = tMNOK(|cwd:///RascalGBT/N72.rsc|);
test bool tcN73() = tMNOK(|cwd:///RascalGBT/N73.rsc|);
test bool tcN74() = tMNOK(|cwd:///RascalGBT/N74.rsc|);
test bool tcN75() = tMNOK(|cwd:///RascalGBT/N75.rsc|);
test bool tcN76() = tMNOK(|cwd:///RascalGBT/N76.rsc|);
test bool tcN77() = tMNOK(|cwd:///RascalGBT/N77.rsc|);
test bool tcN78() = tMNOK(|cwd:///RascalGBT/N78.rsc|);
test bool tcN79() = tMNOK(|cwd:///RascalGBT/N79.rsc|);
test bool tcN8() = tMNOK(|cwd:///RascalGBT/N8.rsc|);
test bool tcN80() = tMNOK(|cwd:///RascalGBT/N80.rsc|);
test bool tcN82() = tMNOK(|cwd:///RascalGBT/N82.rsc|);
test bool tcN83() = tMNOK(|cwd:///RascalGBT/N83.rsc|);
test bool tcN84() = tMNOK(|cwd:///RascalGBT/N84.rsc|);
test bool tcN86() = tMNOK(|cwd:///RascalGBT/N86.rsc|);
test bool tcN87() = tMNOK(|cwd:///RascalGBT/N87.rsc|);
test bool tcN88() = tMNOK(|cwd:///RascalGBT/N88.rsc|);
test bool tcN9() = tMNOK(|cwd:///RascalGBT/N9.rsc|);
test bool tcN90() = tMNOK(|cwd:///RascalGBT/N90.rsc|);
test bool tcN91() = tMNOK(|cwd:///RascalGBT/N91.rsc|);
test bool tcN93() = tMNOK(|cwd:///RascalGBT/N93.rsc|);
test bool tcN94() = tMNOK(|cwd:///RascalGBT/N94.rsc|);
test bool tcN95() = tMNOK(|cwd:///RascalGBT/N95.rsc|);
test bool tcN96() = tMNOK(|cwd:///RascalGBT/N96.rsc|);
test bool tcN97() = tMNOK(|cwd:///RascalGBT/N97.rsc|);
test bool tcN98() = tMNOK(|cwd:///RascalGBT/N98.rsc|);
test bool tcN99() = tMNOK(|cwd:///RascalGBT/N99.rsc|);
