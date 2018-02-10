module chkDecl_AC

import TestUtil;

//p1 -> p5868
//p2 -> p5868
//p3 -> p5875
//p4 -> p5875
//p5 -> p5876
//p6 -> p5996
//p7 -> p6039
//p8 -> p6061

//{'p5p6p7p1p2p3p4p8'}
test bool tc1() = tcModule("tc1","public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p2p5p6p7p8p3p4'}
test bool tc2() = tcModule("tc2","public int a1 = 0+0; public int a2; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p3p6p7p4p5p8'}
test bool tc3() = tcModule("tc3","public int a1 = 0+0; public int a2; public int a3 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p2p8p1p3p4p5p6p7'}
test bool tc4() = tcModule("tc4","public int a2; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p3p4p5p6p7p8'}
test bool tc5() = tcModule("tc5","void f(); ");

//{'p2p4p5p6p1p3p7p8'}
test bool tc6() = tcModule("tc6","public int a2; public int a4; public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p2p3p5p6p7p1p4p8'}
test bool tc7() = tcModule("tc7","public int a2; public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p2p5p3p4p6p7p8'}
test bool tc8() = tcModule("tc8","public int a1 = 0+0; public int a2; public int a5 = 0+0; void f(); ");

//{'p1p2p4p5p7p3p6p8'}
test bool tc9() = tcModule("tc9","public int a1 = 0+0; public int a2; public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p1p2p3p5p7p8p4p6'}
test bool tc10() = tcModule("tc10","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p7p8p1p2p3p4p5p6'}
test bool tc11() = tcModule("tc11","data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p5p7p8p3p4p6'}
test bool tc12() = tcModule("tc12","public int a1 = 0+0; public int a2; public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p4p5p8p1p3p6p7'}
test bool tc13() = tcModule("tc13","public int a2; public int a4; public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p6p7p8p1p3p4p5'}
test bool tc14() = tcModule("tc14","public int a2; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p4p7p8p3p5p6'}
test bool tc15() = tcModule("tc15","public int a1 = 0+0; public int a2; public int a4; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p7p8p1p3p4p5p6'}
test bool tc16() = tcModule("tc16","public int a2; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p3p4p2p5p6p7p8'}
test bool tc17() = tcModule("tc17","public int a1 = 0+0; public int a3 = 0+0; public int a4; void f(); ");

//{'p1p2p6p3p4p5p7p8'}
test bool tc18() = tcModule("tc18","public int a1 = 0+0; public int a2; data d6(int a=0); void f(); ");

//{'p1p3p4p7p2p5p6p8'}
test bool tc19() = tcModule("tc19","public int a1 = 0+0; public int a3 = 0+0; public int a4; data d7(int a=0) = d7(); void f(); ");

//{'p3p8p1p2p4p5p6p7'}
test bool tc20() = tcModule("tc20","public int a3 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p3p5p7p8p2p4p6'}
test bool tc21() = tcModule("tc21","public int a1 = 0+0; public int a3 = 0+0; public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p3p6p7p8p2p4p5'}
test bool tc22() = tcModule("tc22","public int a1 = 0+0; public int a3 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p6p7p8p3p4p5'}
test bool tc23() = tcModule("tc23","public int a1 = 0+0; public int a2; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p4p7p3p5p6p8'}
test bool tc24() = tcModule("tc24","public int a1 = 0+0; public int a2; public int a4; data d7(int a=0) = d7(); void f(); ");

//{'p3p5p8p1p2p4p6p7'}
test bool tc25() = tcModule("tc25","public int a3 = 0+0; public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p4p6p8p1p2p5p7'}
test bool tc26() = tcModule("tc26","public int a3 = 0+0; public int a4; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p5p6p3p4p7p8'}
test bool tc27() = tcModule("tc27","public int a1 = 0+0; public int a2; public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p1p2p4p5p6p8p3p7'}
test bool tc28() = tcModule("tc28","public int a1 = 0+0; public int a2; public int a4; public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p3p6p7p2p4p5p8'}
test bool tc29() = tcModule("tc29","public int a1 = 0+0; public int a3 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p3p6p7p1p2p4p5p8'}
test bool tc30() = tcModule("tc30","public int a3 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p3p4p5p6p7p2p8'}
test bool tc31() = tcModule("tc31","public int a1 = 0+0; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p7p1p2p3p4p5p6p8'}
test bool tc32() = tcModule("tc32","data d7(int a=0) = d7(); void f(); ");

//{'p1p2p7p8p3p4p5p6'}
test bool tc33() = tcModule("tc33","public int a1 = 0+0; public int a2; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p7p2p3p4p5p6p8'}
test bool tc34() = tcModule("tc34","public int a1 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p1p2p4p3p5p6p7p8'}
test bool tc35() = tcModule("tc35","public int a1 = 0+0; public int a2; public int a4; void f(); ");

//{'p2p3p4p5p8p1p6p7'}
test bool tc36() = tcModule("tc36","public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p3p4p6p8p5p7'}
test bool tc37() = tcModule("tc37","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p7p1p2p4p5p6p8'}
test bool tc38() = tcModule("tc38","public int a3 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p2p3p4p6p7p8p1p5'}
test bool tc39() = tcModule("tc39","public int a2; public int a3 = 0+0; public int a4; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p7p1p3p4p5p6p8'}
test bool tc40() = tcModule("tc40","public int a2; data d7(int a=0) = d7(); void f(); ");

//{'p1p3p8p2p4p5p6p7'}
test bool tc41() = tcModule("tc41","public int a1 = 0+0; public int a3 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p5p7p3p4p6p8'}
test bool tc42() = tcModule("tc42","public int a1 = 0+0; public int a2; public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p4p5p6p8p1p2p3p7'}
test bool tc43() = tcModule("tc43","public int a4; public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p4p5p6p7p1p2p3p8'}
test bool tc44() = tcModule("tc44","public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p3p5p6p7p8p2p4'}
test bool tc45() = tcModule("tc45","public int a1 = 0+0; public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p7p8p1p4p5p6'}
test bool tc46() = tcModule("tc46","public int a2; public int a3 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p4p5p6p7p8p2p3'}
test bool tc47() = tcModule("tc47","public int a1 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p5p7p8p1p3p4p6'}
test bool tc48() = tcModule("tc48","public int a2; public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p4p6p1p5p7p8'}
test bool tc49() = tcModule("tc49","public int a2; public int a3 = 0+0; public int a4; data d6(int a=0); void f(); ");

//{'p1p2p3p4p5p8p6p7'}
test bool tc50() = tcModule("tc50","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p4p5p6p1p7p8'}
test bool tc51() = tcModule("tc51","public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p1p4p5p6p8p2p3p7'}
test bool tc52() = tcModule("tc52","public int a1 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p3p4p5p6p7p8'}
test bool tc53() = tcModule("tc53","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); ");

//{'p1p4p5p7p8p2p3p6'}
test bool tc54() = tcModule("tc54","public int a1 = 0+0; public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p4p5p1p2p6p7p8'}
test bool tc55() = tcModule("tc55","public int a3 = 0+0; public int a4; public int a5 = 0+0; void f(); ");

//{'p1p2p4p6p8p3p5p7'}
test bool tc56() = tcModule("tc56","public int a1 = 0+0; public int a2; public int a4; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p5p7p1p2p3p4p6p8'}
test bool tc57() = tcModule("tc57","public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p1p2p3p4p5p7p6p8'}
test bool tc58() = tcModule("tc58","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p1p3p5p7p2p4p6p8'}
test bool tc59() = tcModule("tc59","public int a1 = 0+0; public int a3 = 0+0; public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p1p4p5p7p2p3p6p8'}
test bool tc60() = tcModule("tc60","public int a1 = 0+0; public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p1p4p5p8p2p3p6p7'}
test bool tc61() = tcModule("tc61","public int a1 = 0+0; public int a4; public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p3p5p6p7p2p4p8'}
test bool tc62() = tcModule("tc62","public int a1 = 0+0; public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p4p6p2p3p5p7p8'}
test bool tc63() = tcModule("tc63","public int a1 = 0+0; public int a4; data d6(int a=0); void f(); ");

//{'p2p3p4p5p1p6p7p8'}
test bool tc64() = tcModule("tc64","public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; void f(); ");

//{'p1p4p5p2p3p6p7p8'}
test bool tc65() = tcModule("tc65","public int a1 = 0+0; public int a4; public int a5 = 0+0; void f(); ");

//{'p1p2p3p4p6p7p5p8'}
test bool tc66() = tcModule("tc66","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p4p6p7p8p2p3p5'}
test bool tc67() = tcModule("tc67","public int a1 = 0+0; public int a4; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p4p6p7p2p3p5p8'}
test bool tc68() = tcModule("tc68","public int a1 = 0+0; public int a4; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p2p6p1p3p4p5p7p8'}
test bool tc69() = tcModule("tc69","public int a2; data d6(int a=0); void f(); ");

//{'p1p2p4p8p3p5p6p7'}
test bool tc70() = tcModule("tc70","public int a1 = 0+0; public int a2; public int a4; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p7p3p4p5p6p8'}
test bool tc71() = tcModule("tc71","public int a1 = 0+0; public int a2; data d7(int a=0) = d7(); void f(); ");

//{'p1p3p7p2p4p5p6p8'}
test bool tc72() = tcModule("tc72","public int a1 = 0+0; public int a3 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p1p3p4p5p8p2p6p7'}
test bool tc73() = tcModule("tc73","public int a1 = 0+0; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p5p6p8p1p4p7'}
test bool tc74() = tcModule("tc74","public int a2; public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p4p5p6p1p2p7p8'}
test bool tc75() = tcModule("tc75","public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p4p6p1p2p3p5p7p8'}
test bool tc76() = tcModule("tc76","public int a4; data d6(int a=0); void f(); ");

//{'p2p6p7p1p3p4p5p8'}
test bool tc77() = tcModule("tc77","public int a2; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p2p3p5p6p4p7p8'}
test bool tc78() = tcModule("tc78","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p1p2p3p4p5p6p7p8'}
test bool tc79() = tcModule("tc79","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; void f(); ");

//{'p1p2p3p5p6p7p8p4'}
test bool tc80() = tcModule("tc80","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p4p8p2p3p5p6p7'}
test bool tc81() = tcModule("tc81","public int a1 = 0+0; public int a4; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p4p5p6p7p1p8'}
test bool tc82() = tcModule("tc82","public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p2p4p5p7p8p3p6'}
test bool tc83() = tcModule("tc83","public int a1 = 0+0; public int a2; public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p1p4p5p6p7p8'}
test bool tc84() = tcModule("tc84","public int a2; public int a3 = 0+0; void f(); ");

//{'p1p2p4p5p3p6p7p8'}
test bool tc85() = tcModule("tc85","public int a1 = 0+0; public int a2; public int a4; public int a5 = 0+0; void f(); ");

//{'p1p3p4p5p6p7p8p2'}
test bool tc86() = tcModule("tc86","public int a1 = 0+0; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p6p7p8p2p3p4p5'}
test bool tc87() = tcModule("tc87","public int a1 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p3p4p5p6p7p8'}
test bool tc88() = tcModule("tc88","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p5p8p1p2p3p4p6p7'}
test bool tc89() = tcModule("tc89","public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p5p6p1p3p4p7p8'}
test bool tc90() = tcModule("tc90","public int a2; public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p1p2p5p6p7p3p4p8'}
test bool tc91() = tcModule("tc91","public int a1 = 0+0; public int a2; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p4p2p3p5p6p7p8'}
test bool tc92() = tcModule("tc92","public int a1 = 0+0; public int a4; void f(); ");

//{'p1p5p6p7p8p2p3p4'}
test bool tc93() = tcModule("tc93","public int a1 = 0+0; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p5p8p3p4p6p7'}
test bool tc94() = tcModule("tc94","public int a1 = 0+0; public int a2; public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p4p6p1p3p5p7p8'}
test bool tc95() = tcModule("tc95","public int a2; public int a4; data d6(int a=0); void f(); ");

//{'p1p3p4p7p8p2p5p6'}
test bool tc96() = tcModule("tc96","public int a1 = 0+0; public int a3 = 0+0; public int a4; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p4p5p6p7p8p1p2'}
test bool tc97() = tcModule("tc97","public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p5p6p7p2p3p4p8'}
test bool tc98() = tcModule("tc98","public int a1 = 0+0; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p4p6p7p1p2p3p5p8'}
test bool tc99() = tcModule("tc99","public int a4; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p3p4p5p6p2p7p8'}
test bool tc100() = tcModule("tc100","public int a1 = 0+0; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p1p2p4p6p7p8p3p5'}
test bool tc101() = tcModule("tc101","public int a1 = 0+0; public int a2; public int a4; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p6p7p2p3p4p5p8'}
test bool tc102() = tcModule("tc102","public int a1 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p4p7p8p1p2p3p5p6'}
test bool tc103() = tcModule("tc103","public int a4; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p4p8p1p2p5p6p7'}
test bool tc104() = tcModule("tc104","public int a3 = 0+0; public int a4; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p5p7p8p2p3p4p6'}
test bool tc105() = tcModule("tc105","public int a1 = 0+0; public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p7p8p1p2p4p5p6'}
test bool tc106() = tcModule("tc106","public int a3 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p3p5p6p8p4p7'}
test bool tc107() = tcModule("tc107","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p3p5p6p8p2p4p7'}
test bool tc108() = tcModule("tc108","public int a1 = 0+0; public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p6p7p8p1p2p3p4p5'}
test bool tc109() = tcModule("tc109","data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p5p6p2p3p4p7p8'}
test bool tc110() = tcModule("tc110","public int a1 = 0+0; public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p1p2p3p4p6p5p7p8'}
test bool tc111() = tcModule("tc111","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; data d6(int a=0); void f(); ");

//{'p1p2p3p5p4p6p7p8'}
test bool tc112() = tcModule("tc112","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a5 = 0+0; void f(); ");

//{'p2p3p8p1p4p5p6p7'}
test bool tc113() = tcModule("tc113","public int a2; public int a3 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p5p7p1p2p4p6p8'}
test bool tc114() = tcModule("tc114","public int a3 = 0+0; public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p1p2p3p8p4p5p6p7'}
test bool tc115() = tcModule("tc115","public int a1 = 0+0; public int a2; public int a3 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p3p4p6p2p5p7p8'}
test bool tc116() = tcModule("tc116","public int a1 = 0+0; public int a3 = 0+0; public int a4; data d6(int a=0); void f(); ");

//{'p3p4p6p7p1p2p5p8'}
test bool tc117() = tcModule("tc117","public int a3 = 0+0; public int a4; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p5p8p2p3p4p6p7'}
test bool tc118() = tcModule("tc118","public int a1 = 0+0; public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p5p6p7p8p1p4'}
test bool tc119() = tcModule("tc119","public int a2; public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p4p6p7p1p3p5p8'}
test bool tc120() = tcModule("tc120","public int a2; public int a4; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p6p8p1p2p3p4p5p7'}
test bool tc121() = tcModule("tc121","data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p4p5p1p3p6p7p8'}
test bool tc122() = tcModule("tc122","public int a2; public int a4; public int a5 = 0+0; void f(); ");

//{'p1p6p2p3p4p5p7p8'}
test bool tc123() = tcModule("tc123","public int a1 = 0+0; data d6(int a=0); void f(); ");

//{'p1p2p3p5p8p4p6p7'}
test bool tc124() = tcModule("tc124","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p3p5p6p7p4p8'}
test bool tc125() = tcModule("tc125","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p2p4p7p8p1p3p5p6'}
test bool tc126() = tcModule("tc126","public int a2; public int a4; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p4p5p6p3p7p8'}
test bool tc127() = tcModule("tc127","public int a1 = 0+0; public int a2; public int a4; public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p2p3p4p5p6p8p1p7'}
test bool tc128() = tcModule("tc128","public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p6p1p2p4p5p7p8'}
test bool tc129() = tcModule("tc129","public int a3 = 0+0; data d6(int a=0); void f(); ");

//{'p1p3p4p5p7p8p2p6'}
test bool tc130() = tcModule("tc130","public int a1 = 0+0; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p1p2p4p5p6p7p8'}
test bool tc131() = tcModule("tc131","public int a3 = 0+0; void f(); ");

//{'p2p4p5p7p8p1p3p6'}
test bool tc132() = tcModule("tc132","public int a2; public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p3p4p5p6p7p8'}
test bool tc133() = tcModule("tc133","public int a1 = 0+0; public int a2; public int a3 = 0+0; void f(); ");

//{'p6p7p1p2p3p4p5p8'}
test bool tc134() = tcModule("tc134","data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p2p3p4p1p5p6p7p8'}
test bool tc135() = tcModule("tc135","public int a2; public int a3 = 0+0; public int a4; void f(); ");

//{'p5p7p8p1p2p3p4p6'}
test bool tc136() = tcModule("tc136","public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p3p7p8p4p5p6'}
test bool tc137() = tcModule("tc137","public int a1 = 0+0; public int a2; public int a3 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p4p6p3p5p7p8'}
test bool tc138() = tcModule("tc138","public int a1 = 0+0; public int a2; public int a4; data d6(int a=0); void f(); ");

//{'p2p3p4p5p6p7p8p1'}
test bool tc139() = tcModule("tc139","public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p8p2p3p4p5p6p7'}
test bool tc140() = tcModule("tc140","public int a1 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p3p4p5p6p8p2p7'}
test bool tc141() = tcModule("tc141","public int a1 = 0+0; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p3p4p6p8p2p5p7'}
test bool tc142() = tcModule("tc142","public int a1 = 0+0; public int a3 = 0+0; public int a4; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p5p6p1p2p4p7p8'}
test bool tc143() = tcModule("tc143","public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p2p3p4p5p7p8p1p6'}
test bool tc144() = tcModule("tc144","public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p3p7p4p5p6p8'}
test bool tc145() = tcModule("tc145","public int a1 = 0+0; public int a2; public int a3 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p1p2p3p6p4p5p7p8'}
test bool tc146() = tcModule("tc146","public int a1 = 0+0; public int a2; public int a3 = 0+0; data d6(int a=0); void f(); ");

//{'p3p5p1p2p4p6p7p8'}
test bool tc147() = tcModule("tc147","public int a3 = 0+0; public int a5 = 0+0; void f(); ");

//{'p2p3p7p1p4p5p6p8'}
test bool tc148() = tcModule("tc148","public int a2; public int a3 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p2p3p4p5p7p1p6p8'}
test bool tc149() = tcModule("tc149","public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p2p3p6p8p1p4p5p7'}
test bool tc150() = tcModule("tc150","public int a2; public int a3 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p4p5p6p8p1p3p7'}
test bool tc151() = tcModule("tc151","public int a2; public int a4; public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p4p7p8p1p2p5p6'}
test bool tc152() = tcModule("tc152","public int a3 = 0+0; public int a4; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p3p2p4p5p6p7p8'}
test bool tc153() = tcModule("tc153","public int a1 = 0+0; public int a3 = 0+0; void f(); ");

//{'p1p2p3p4p5p6p7p8'}
test bool tc154() = tcModule("tc154","public int a1 = 0+0; void f(); ");

//{'p1p2p3p4p5p6p8p7'}
test bool tc155() = tcModule("tc155","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p3p6p2p4p5p7p8'}
test bool tc156() = tcModule("tc156","public int a1 = 0+0; public int a3 = 0+0; data d6(int a=0); void f(); ");

//{'p1p2p4p5p6p7p3p8'}
test bool tc157() = tcModule("tc157","public int a1 = 0+0; public int a2; public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p2p3p6p8p4p5p7'}
test bool tc158() = tcModule("tc158","public int a1 = 0+0; public int a2; public int a3 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p4p7p1p3p5p6p8'}
test bool tc159() = tcModule("tc159","public int a2; public int a4; data d7(int a=0) = d7(); void f(); ");

//{'p1p2p6p8p3p4p5p7'}
test bool tc160() = tcModule("tc160","public int a1 = 0+0; public int a2; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p5p7p1p4p6p8'}
test bool tc161() = tcModule("tc161","public int a2; public int a3 = 0+0; public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p2p3p4p7p8p1p5p6'}
test bool tc162() = tcModule("tc162","public int a2; public int a3 = 0+0; public int a4; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p5p6p8p3p4p7'}
test bool tc163() = tcModule("tc163","public int a1 = 0+0; public int a2; public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p4p7p1p5p6p8'}
test bool tc164() = tcModule("tc164","public int a2; public int a3 = 0+0; public int a4; data d7(int a=0) = d7(); void f(); ");

//{'p4p5p1p2p3p6p7p8'}
test bool tc165() = tcModule("tc165","public int a4; public int a5 = 0+0; void f(); ");

//{'p1p2p3p4p6p7p8p5'}
test bool tc166() = tcModule("tc166","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p5p1p4p6p7p8'}
test bool tc167() = tcModule("tc167","public int a2; public int a3 = 0+0; public int a5 = 0+0; void f(); ");

//{'p1p3p6p8p2p4p5p7'}
test bool tc168() = tcModule("tc168","public int a1 = 0+0; public int a3 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p6p7p8p1p4p5'}
test bool tc169() = tcModule("tc169","public int a2; public int a3 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p3p6p7p8p4p5'}
test bool tc170() = tcModule("tc170","public int a1 = 0+0; public int a2; public int a3 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p4p5p6p7p8p1p2p3'}
test bool tc171() = tcModule("tc171","public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p5p7p8p1p2p4p6'}
test bool tc172() = tcModule("tc172","public int a3 = 0+0; public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p4p1p3p5p6p7p8'}
test bool tc173() = tcModule("tc173","public int a2; public int a4; void f(); ");

//{'p1p2p3p4p7p5p6p8'}
test bool tc174() = tcModule("tc174","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; data d7(int a=0) = d7(); void f(); ");

//{'p1p3p7p8p2p4p5p6'}
test bool tc175() = tcModule("tc175","public int a1 = 0+0; public int a3 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p4p6p7p1p5p8'}
test bool tc176() = tcModule("tc176","public int a2; public int a3 = 0+0; public int a4; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p2p3p5p8p1p4p6p7'}
test bool tc177() = tcModule("tc177","public int a2; public int a3 = 0+0; public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p3p5p7p4p6p8'}
test bool tc178() = tcModule("tc178","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p1p4p5p6p7p2p3p8'}
test bool tc179() = tcModule("tc179","public int a1 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p3p4p5p6p8p1p2p7'}
test bool tc180() = tcModule("tc180","public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p6p7p1p4p5p8'}
test bool tc181() = tcModule("tc181","public int a2; public int a3 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p3p4p8p2p5p6p7'}
test bool tc182() = tcModule("tc182","public int a1 = 0+0; public int a3 = 0+0; public int a4; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p4p6p7p8p1p3p5'}
test bool tc183() = tcModule("tc183","public int a2; public int a4; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p4p6p8p1p3p5p7'}
test bool tc184() = tcModule("tc184","public int a2; public int a4; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p6p1p4p5p7p8'}
test bool tc185() = tcModule("tc185","public int a2; public int a3 = 0+0; data d6(int a=0); void f(); ");

//{'p1p3p5p8p2p4p6p7'}
test bool tc186() = tcModule("tc186","public int a1 = 0+0; public int a3 = 0+0; public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p5p6p1p4p7p8'}
test bool tc187() = tcModule("tc187","public int a2; public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p3p4p5p7p1p2p6p8'}
test bool tc188() = tcModule("tc188","public int a3 = 0+0; public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p3p5p6p8p1p2p4p7'}
test bool tc189() = tcModule("tc189","public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p5p6p1p2p3p4p7p8'}
test bool tc190() = tcModule("tc190","public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p1p3p5p2p4p6p7p8'}
test bool tc191() = tcModule("tc191","public int a1 = 0+0; public int a3 = 0+0; public int a5 = 0+0; void f(); ");

//{'p3p5p6p7p8p1p2p4'}
test bool tc192() = tcModule("tc192","public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p4p5p6p7p1p3p8'}
test bool tc193() = tcModule("tc193","public int a2; public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p2p3p4p5p7p8p6'}
test bool tc194() = tcModule("tc194","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p5p2p3p4p6p7p8'}
test bool tc195() = tcModule("tc195","public int a1 = 0+0; public int a5 = 0+0; void f(); ");

//{'p1p3p4p6p7p2p5p8'}
test bool tc196() = tcModule("tc196","public int a1 = 0+0; public int a3 = 0+0; public int a4; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p2p4p8p1p3p5p6p7'}
test bool tc197() = tcModule("tc197","public int a2; public int a4; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p3p4p5p7p2p6p8'}
test bool tc198() = tcModule("tc198","public int a1 = 0+0; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p2p3p4p6p8p1p5p7'}
test bool tc199() = tcModule("tc199","public int a2; public int a3 = 0+0; public int a4; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p4p5p7p1p2p3p6p8'}
test bool tc200() = tcModule("tc200","public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p1p2p3p4p5p6p7p8'}
test bool tc201() = tcModule("tc201","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; void f(); ");

//{'p3p4p5p8p1p2p6p7'}
test bool tc202() = tcModule("tc202","public int a3 = 0+0; public int a4; public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p8p1p2p3p4p5p6p7'}
test bool tc203() = tcModule("tc203","data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p5p6p7p1p3p4p8'}
test bool tc204() = tcModule("tc204","public int a2; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p4p5p6p2p3p7p8'}
test bool tc205() = tcModule("tc205","public int a1 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p5p1p2p3p4p6p7p8'}
test bool tc206() = tcModule("tc206","public int a5 = 0+0; void f(); ");

//{'p1p5p7p2p3p4p6p8'}
test bool tc207() = tcModule("tc207","public int a1 = 0+0; public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p2p5p7p1p3p4p6p8'}
test bool tc208() = tcModule("tc208","public int a2; public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p2p5p6p7p8p1p3p4'}
test bool tc209() = tcModule("tc209","public int a2; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p4p5p7p8p1p2p6'}
test bool tc210() = tcModule("tc210","public int a3 = 0+0; public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p5p8p1p3p4p6p7'}
test bool tc211() = tcModule("tc211","public int a2; public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p6p7p8p1p2p4p5'}
test bool tc212() = tcModule("tc212","public int a3 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p5p1p3p4p6p7p8'}
test bool tc213() = tcModule("tc213","public int a2; public int a5 = 0+0; void f(); ");

//{'p4p6p7p8p1p2p3p5'}
test bool tc214() = tcModule("tc214","public int a4; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p4p1p2p3p5p6p7p8'}
test bool tc215() = tcModule("tc215","public int a4; void f(); ");

//{'p1p2p3p4p5p6p7p8'}
test bool tc216() = tcModule("tc216","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p4p5p6p1p2p3p7p8'}
test bool tc217() = tcModule("tc217","public int a4; public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p2p1p3p4p5p6p7p8'}
test bool tc218() = tcModule("tc218","public int a2; void f(); ");

//{'p2p6p8p1p3p4p5p7'}
test bool tc219() = tcModule("tc219","public int a2; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p4p7p2p3p5p6p8'}
test bool tc220() = tcModule("tc220","public int a1 = 0+0; public int a4; data d7(int a=0) = d7(); void f(); ");

//{'p1p2p4p5p8p3p6p7'}
test bool tc221() = tcModule("tc221","public int a1 = 0+0; public int a2; public int a4; public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p6p7p3p4p5p8'}
test bool tc222() = tcModule("tc222","public int a1 = 0+0; public int a2; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p4p6p8p1p2p3p5p7'}
test bool tc223() = tcModule("tc223","public int a4; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p4p5p8p1p2p3p6p7'}
test bool tc224() = tcModule("tc224","public int a4; public int a5 = 0+0; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p3p4p6p7p8p2p5'}
test bool tc225() = tcModule("tc225","public int a1 = 0+0; public int a3 = 0+0; public int a4; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p4p6p8p2p3p5p7'}
test bool tc226() = tcModule("tc226","public int a1 = 0+0; public int a4; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p6p8p2p3p4p5p7'}
test bool tc227() = tcModule("tc227","public int a1 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p4p6p7p3p5p8'}
test bool tc228() = tcModule("tc228","public int a1 = 0+0; public int a2; public int a4; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p1p2p3p4p7p8p5p6'}
test bool tc229() = tcModule("tc229","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p4p5p6p7p1p2p8'}
test bool tc230() = tcModule("tc230","public int a3 = 0+0; public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p4p7p1p2p3p5p6p8'}
test bool tc231() = tcModule("tc231","public int a4; data d7(int a=0) = d7(); void f(); ");

//{'p1p3p5p6p2p4p7p8'}
test bool tc232() = tcModule("tc232","public int a1 = 0+0; public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); void f(); ");

//{'p2p4p5p7p1p3p6p8'}
test bool tc233() = tcModule("tc233","public int a2; public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); void f(); ");

//{'p6p1p2p3p4p5p7p8'}
test bool tc234() = tcModule("tc234","data d6(int a=0); void f(); ");

//{'p1p2p4p5p6p7p8p3'}
test bool tc235() = tcModule("tc235","public int a1 = 0+0; public int a2; public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p3p4p8p5p6p7'}
test bool tc236() = tcModule("tc236","public int a1 = 0+0; public int a2; public int a3 = 0+0; public int a4; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p5p6p8p1p3p4p7'}
test bool tc237() = tcModule("tc237","public int a2; public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p2p8p3p4p5p6p7'}
test bool tc238() = tcModule("tc238","public int a1 = 0+0; public int a2; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p5p7p8p1p4p6'}
test bool tc239() = tcModule("tc239","public int a2; public int a3 = 0+0; public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p4p7p8p2p3p5p6'}
test bool tc240() = tcModule("tc240","public int a1 = 0+0; public int a4; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p2p3p4p8p1p5p6p7'}
test bool tc241() = tcModule("tc241","public int a2; public int a3 = 0+0; public int a4; data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p7p8p2p3p4p5p6'}
test bool tc242() = tcModule("tc242","public int a1 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p4p1p2p5p6p7p8'}
test bool tc243() = tcModule("tc243","public int a3 = 0+0; public int a4; void f(); ");

//{'p3p4p6p7p8p1p2p5'}
test bool tc244() = tcModule("tc244","public int a3 = 0+0; public int a4; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p4p6p1p2p5p7p8'}
test bool tc245() = tcModule("tc245","public int a3 = 0+0; public int a4; data d6(int a=0); void f(); ");

//{'p3p4p7p1p2p5p6p8'}
test bool tc246() = tcModule("tc246","public int a3 = 0+0; public int a4; data d7(int a=0) = d7(); void f(); ");

//{'p1p2p3p4p5p6p7p8'}
test bool tc247() = tcModule("tc247","public int a1 = 0+0; public int a2; void f(); ");

//{'p1p3p4p5p2p6p7p8'}
test bool tc248() = tcModule("tc248","public int a1 = 0+0; public int a3 = 0+0; public int a4; public int a5 = 0+0; void f(); ");

//{'p5p6p7p8p1p2p3p4'}
test bool tc249() = tcModule("tc249","public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p5p6p7p1p2p4p8'}
test bool tc250() = tcModule("tc250","public int a3 = 0+0; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); void f(); ");

//{'p2p4p5p6p7p8p1p3'}
test bool tc251() = tcModule("tc251","public int a2; public int a4; public int a5 = 0+0; data d6(int a=0); data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p3p6p8p1p2p4p5p7'}
test bool tc252() = tcModule("tc252","public int a3 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p1p5p6p8p2p3p4p7'}
test bool tc253() = tcModule("tc253","public int a1 = 0+0; public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p4p5p7p8p1p2p3p6'}
test bool tc254() = tcModule("tc254","public int a4; public int a5 = 0+0; data d7(int a=0) = d7(); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p5p6p8p1p2p3p4p7'}
test bool tc255() = tcModule("tc255","public int a5 = 0+0; data d6(int a=0); data d8(int a = 0, int b = 0) = d8(); void f(); ");

//{'p4p8p1p2p3p5p6p7'}
test bool tc256() = tcModule("tc256","public int a4; data d8(int a = 0, int b = 0) = d8(); void f(); ");

