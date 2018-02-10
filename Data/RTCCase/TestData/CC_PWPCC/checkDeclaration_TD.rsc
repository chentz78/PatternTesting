module chkDecl_PW

import TestUtil;

//p1 -> p5868
//p2 -> p5868
//p3 -> p5875
//p4 -> p5875
//p5 -> p5876
//p6 -> p5996
//p7 -> p6039
//p8 -> p6061

//{'p2p4'}
test bool tc1() = tcModule("tc1","public int a2; public int a4; ");

//{'p2p1','p2p3','p2p4','p2p5','p2p6','p2p7','p2p8'}
test bool tc2() = tcModule("tc2","public int a2; void f(); ");

//{'p1p2','p1p3','p1p4','p1p5','p1p6','p1p7','p1p8'}
test bool tc3() = tcModule("tc3","public int a1 = 0+0; void f(); ");

//{'p5p1','p5p2','p5p3','p5p4','p5p6','p5p7','p5p8'}
test bool tc4() = tcModule("tc4","public int a5 = 0+0; void f(); ");

//{'p1p2','p1p3','p1p4','p1p5','p1p6','p1p7','p1p8','p2p3','p2p4','p2p5','p2p6','p2p7','p2p8','p3p4','p3p5','p3p6','p3p7','p3p8','p4p5','p4p6','p4p7','p4p8','p5p6','p5p7','p5p8','p6p7','p6p8','p7p8'}
test bool tc5() = tcModule("tc5","void f(); ");

//{'p7p1','p7p2','p7p3','p7p4','p7p5','p7p6','p7p8'}
test bool tc6() = tcModule("tc6","data d7(int a=0) = d7(); void f(); ");

//{'p4p8'}
test bool tc7() = tcModule("tc7","public int a4; data d8(int a = 0, int b = 0) = d8(); ");

//{'p5p6'}
test bool tc8() = tcModule("tc8","public int a5 = 0+0; data d6(int a=0); ");

//{'p1p6'}
test bool tc9() = tcModule("tc9","public int a1 = 0+0; data d6(int a=0); ");

//{'p4p1','p4p2','p4p3','p4p5','p4p6','p4p7','p4p8'}
test bool tc10() = tcModule("tc10","public int a4; void f(); ");

//{'p3p1','p3p2','p3p4','p3p5','p3p6','p3p7','p3p8'}
test bool tc11() = tcModule("tc11","public int a3 = 0+0; void f(); ");

//{'p2p5'}
test bool tc12() = tcModule("tc12","public int a2; public int a5 = 0+0; ");

//{'p2p3'}
test bool tc13() = tcModule("tc13","public int a2; public int a3 = 0+0; ");

//{'p7p8'}
test bool tc14() = tcModule("tc14","data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); ");

//{'p3p5'}
test bool tc15() = tcModule("tc15","public int a3 = 0+0; public int a5 = 0+0; ");

//{'p1p7'}
test bool tc16() = tcModule("tc16","public int a1 = 0+0; data d7(int a=0) = d7(); ");

//{'p1p8'}
test bool tc17() = tcModule("tc17","public int a1 = 0+0; data d8(int a = 0, int b = 0) = d8(); ");

//{'p2p6'}
test bool tc18() = tcModule("tc18","public int a2; data d6(int a=0); ");

//{'p4p6'}
test bool tc19() = tcModule("tc19","public int a4; data d6(int a=0); ");

//{'p1p3'}
test bool tc20() = tcModule("tc20","public int a1 = 0+0; public int a3 = 0+0; ");

//{'p1p5'}
test bool tc21() = tcModule("tc21","public int a1 = 0+0; public int a5 = 0+0; ");

//{'p2p7'}
test bool tc22() = tcModule("tc22","public int a2; data d7(int a=0) = d7(); ");

//{'p1p4'}
test bool tc23() = tcModule("tc23","public int a1 = 0+0; public int a4; ");

//{'p5p8'}
test bool tc24() = tcModule("tc24","public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); ");

//{'p3p4'}
test bool tc25() = tcModule("tc25","public int a3 = 0+0; public int a4; ");

//{'p3p8'}
test bool tc26() = tcModule("tc26","public int a3 = 0+0; data d8(int a = 0, int b = 0) = d8(); ");

//{'p8p1','p8p2','p8p3','p8p4','p8p5','p8p6','p8p7'}
test bool tc27() = tcModule("tc27","data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p7'}
test bool tc28() = tcModule("tc28","public int a3 = 0+0; data d7(int a=0) = d7(); ");

//{'p6p7'}
test bool tc29() = tcModule("tc29","data d6(int a=0); data d7(int a=0) = d7(); ");

//{'p2p8'}
test bool tc30() = tcModule("tc30","public int a2; data d8(int a = 0, int b = 0) = d8(); ");

//{'p6p1','p6p2','p6p3','p6p4','p6p5','p6p7','p6p8'}
test bool tc31() = tcModule("tc31","data d6(int a=0); void f(); ");

//{'p4p5'}
test bool tc32() = tcModule("tc32","public int a4; public int a5 = 0+0; ");

//{'p3p6'}
test bool tc33() = tcModule("tc33","public int a3 = 0+0; data d6(int a=0); ");

//{'p1p2'}
test bool tc34() = tcModule("tc34","public int a1 = 0+0; public int a2; ");

//{'p4p7'}
test bool tc35() = tcModule("tc35","public int a4; data d7(int a=0) = d7(); ");

//{'p5p7'}
test bool tc36() = tcModule("tc36","public int a5 = 0+0; data d7(int a=0) = d7(); ");

//{'p6p8'}
test bool tc37() = tcModule("tc37","data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); ");

