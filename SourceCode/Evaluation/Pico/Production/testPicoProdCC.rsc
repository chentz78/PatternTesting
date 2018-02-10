module testPicoProdCC

import testPicoCalcCC;

private loc getTDPath() = |file:///Users/chentz/L/testgeneration-cwi.git/rascal.workfolder/PicoMetric/src/Production/TDSProd|;

test bool tcTD_1() = testCC(getTDPath(),"TD_1.pico",1);
test bool tcTD_2() = testCC(getTDPath(),"TD_2.pico",1);
test bool tcTD_3() = testCC(getTDPath(),"TD_3.pico",1);
test bool tcTD_4() = testCC(getTDPath(),"TD_4.pico",1);
test bool tcTD_5() = testCC(getTDPath(),"TD_5.pico",1);
test bool tcTD_6() = testCC(getTDPath(),"TD_6.pico",1);
test bool tcTD_7() = testCC(getTDPath(),"TD_7.pico",1);
test bool tcTD_8() = testCC(getTDPath(),"TD_8.pico",2);
test bool tcTD_9() = testCC(getTDPath(),"TD_9.pico",3);
test bool tcTD_10() = testCC(getTDPath(),"TD_10.pico",1);
//test bool tcTD_10() = testCC(getTDPath(),"TD_10.pico",10);
