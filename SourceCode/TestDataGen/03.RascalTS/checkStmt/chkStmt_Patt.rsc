module chkStmt_Patt

import TestUtil;

//p1 -> p4388
//p2 -> p4438
//p3 -> p4515
//p4 -> p4586
//p5 -> p4663
//p6 -> p4717
//p7 -> p4778
//p8 -> p4814
//p9 -> p4826
//p10 -> p4846
//p11 -> p4956
//p12 -> p5037
//p13 -> p5072
//p14 -> p5097
//p15 -> p5097
//p16 -> p5098
//p17 -> p5108
//p18 -> p5108
//p19 -> p5109

//{'p6'}
test bool tc1() = testCase("tc1","int a; n0: if (a == 0) { a += 1; } else { a +=1; }");

//{'p17'}
test bool tc2() = testCase("tc2","int a; a = a + 0;");

//{'p9'}
test bool tc3() = testCase("tc3","int a; n0: for (int i := a) { break n0; }");

//{'p1'}
test bool tc4() = testCase("tc4","int a; n0: top-down visit(a) { case int i =\> i }");

//{'p13'}
test bool tc5() = testCase("tc5","int a; n0: for (int i := a) { append i; }");

//{'p11'}
test bool tc6() = testCase("tc6","int a; n0: { a +=1; }");

//{'p3'}
test bool tc7() = testCase("tc7","int a; n0: do { a += 1; } while (a==0);");

//{'p5'}
test bool tc8() = testCase("tc8","int a; n0: if (a == 0) { a += 1; }");

//{'p16'}
test bool tc9() = testCase("tc9","int a; int b2,b3;");

//{'p14'}
test bool tc10() = testCase("tc10","int a; int b0;");

//{'p15'}
test bool tc11() = testCase("tc11","int a; dynamic int b1;");

//{'p10'}
test bool tc12() = testCase("tc12","int a; n0: for (int i := a) { continue n0; }");

//{'p8'}
test bool tc13() = testCase("tc13","int a; n0: for (int i := a) { fail n0; }");

//{'p7'}
test bool tc14() = testCase("tc14","int a; n0: switch(a) { case int i : a +=1; }");

//{'p4'}
test bool tc15() = testCase("tc15","int a; n0: for (int i := a) { a += 1; }");

//{'p12'}
test bool tc16() = testCase("tc16","int a; n0: top-down visit(a) { case int i : insert i; }");

//{'p18'}
test bool tc17() = testCase("tc17","int a; a;");

//{'p2'}
test bool tc18() = testCase("tc18","int a; n0: while(a==0) { a += 1; }");

//{'p19'}
test bool tc19() = testCase("tc19","int a; int b4=0;");

