module testPicoPWPCCC

import testPicoCalcCC;

private loc getTDPath() = |file:///Users/chentz/L/testgeneration-cwi.git/rascal.workfolder/PicoMetric/src/PWPC/TDSPWPC|;

test bool tcTD_1() = testCC(getTDPath(),"TD_1.pico",3);
test bool tcTD_2() = testCC(getTDPath(),"TD_2.pico",2);
test bool tcTD_3() = testCC(getTDPath(),"TD_3.pico",2);
test bool tcTD_4() = testCC(getTDPath(),"TD_4.pico",1);