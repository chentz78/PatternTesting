module chkDecl_Patt

import TestUtil;

//p1 -> p5868
//p2 -> p5868
//p3 -> p5875
//p4 -> p5875
//p5 -> p5876
//p6 -> p5996
//p7 -> p6039
//p8 -> p6061

//{'p3'}
test bool tc1() = tcModule("tc1","public int a3 = 0+0; ");

//{'p5'}
test bool tc2() = tcModule("tc2","public int a5 = 0+0; ");

//{'p6'}
test bool tc3() = tcModule("tc3","data d6(int a=0); ");

//{'p4'}
test bool tc4() = tcModule("tc4","public int a4; ");

//{'p1'}
test bool tc5() = tcModule("tc5","public int a1 = 0+0; ");

//{'p7'}
test bool tc6() = tcModule("tc6","data d7(int a=0) = d7(); ");

//{'p2'}
test bool tc7() = tcModule("tc7","public int a2; ");

//{'p8'}
test bool tc8() = tcModule("tc8","data d8(int a = 0, int b = 0) = d8(); ");

