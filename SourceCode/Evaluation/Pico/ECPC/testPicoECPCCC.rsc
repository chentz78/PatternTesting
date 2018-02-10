module testPicoECPCCC

import testPicoCalcCC;

private loc getTDPath() = |file:///Users/chentz/L/testgeneration-cwi.git/rascal.workfolder/PicoMetric/src/ECPC/TDSECPC|;

test bool tcTD_1() = testCC(getTDPath(),"TD_1.pico",2);
test bool tcTD_2() = testCC(getTDPath(),"TD_2.pico",2);