module testPicoProdSLOC

import testPicoSLOC;

private loc getTDPath() = |file:///Users/chentz/L/testgeneration-cwi.git/rascal.workfolder/PicoMetric/src/Production/TDSProd|;

test bool tcTD_1() = testCheck(getTDPath(),"TD_1.pico",5);
test bool tcTD_2() = testCheck(getTDPath(),"TD_2.pico",5);
test bool tcTD_3() = testCheck(getTDPath(),"TD_3.pico",5);
test bool tcTD_4() = testCheck(getTDPath(),"TD_4.pico",5);
test bool tcTD_5() = testCheck(getTDPath(),"TD_5.pico",5);
test bool tcTD_6() = testCheck(getTDPath(),"TD_6.pico",5);
test bool tcTD_7() = testCheck(getTDPath(),"TD_7.pico",5);
test bool tcTD_8() = testCheck(getTDPath(),"TD_8.pico",9);
test bool tcTD_9() = testCheck(getTDPath(),"TD_9.pico",10);
test bool tcTD_10() = testCheck(getTDPath(),"TD_10.pico",5);
//test bool tcTD_10() = testCheck(getTDPath(),"TD_10.pico",10);
