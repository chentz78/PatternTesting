module testPicoPatt

import testPicoCalcCC;

private loc getTDPath() = |cwd:///TDSPatt/|;

test bool tcTD_1() = testCC(getTDPath(),"TD_1.pico",2);
test bool tcTD_2() = testCC(getTDPath(),"TD_2.pico",2);