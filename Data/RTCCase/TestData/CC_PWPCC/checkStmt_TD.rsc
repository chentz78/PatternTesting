module chkStmt_PW

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

//{'p3p8'}
test bool tc1() = testCase("tc1","int a; n0: do { a += 1; } while (a==0);; n0: for (int i := a) { fail n0; }");

//{'p13p1','p13p10','p13p11','p13p12','p13p14','p13p15','p13p16','p13p17','p13p18','p13p19','p13p2','p13p3','p13p4','p13p5','p13p6','p13p7','p13p8','p13p9'}
test bool tc2() = testCase("tc2","int a; n0: for (int i := a) { append i; }; void f();");

//{'p1p6'}
test bool tc3() = testCase("tc3","int a; n0: top-down visit(a) { case int i =\> i }; n0: if (a == 0) { a += 1; } else { a +=1; }");

//{'p9p16'}
test bool tc4() = testCase("tc4","int a; n0: for (int i := a) { break n0; }; int b2,b3;");

//{'p5p6'}
test bool tc5() = testCase("tc5","int a; n0: if (a == 0) { a += 1; }; n0: if (a == 0) { a += 1; } else { a +=1; }");

//{'p16p18'}
test bool tc6() = testCase("tc6","int a; int b2,b3;; a;");

//{'p5p13'}
test bool tc7() = testCase("tc7","int a; n0: if (a == 0) { a += 1; }; n0: for (int i := a) { append i; }");

//{'p13p18'}
test bool tc8() = testCase("tc8","int a; n0: for (int i := a) { append i; }; a;");

//{'p12p13'}
test bool tc9() = testCase("tc9","int a; n0: top-down visit(a) { case int i : insert i; }; n0: for (int i := a) { append i; }");

//{'p7p19'}
test bool tc10() = testCase("tc10","int a; n0: switch(a) { case int i : a +=1; }; int b4=0;");

//{'p2p16'}
test bool tc11() = testCase("tc11","int a; n0: while(a==0) { a += 1; }; int b2,b3;");

//{'p4p1','p4p10','p4p11','p4p12','p4p13','p4p14','p4p15','p4p16','p4p17','p4p18','p4p19','p4p2','p4p3','p4p5','p4p6','p4p7','p4p8','p4p9'}
test bool tc12() = testCase("tc12","int a; n0: for (int i := a) { a += 1; }; void f();");

//{'p2p12'}
test bool tc13() = testCase("tc13","int a; n0: while(a==0) { a += 1; }; n0: top-down visit(a) { case int i : insert i; }");

//{'p15p18'}
test bool tc14() = testCase("tc14","int a; dynamic int b1;; a;");

//{'p11p1','p11p10','p11p12','p11p13','p11p14','p11p15','p11p16','p11p17','p11p18','p11p19','p11p2','p11p3','p11p4','p11p5','p11p6','p11p7','p11p8','p11p9'}
test bool tc15() = testCase("tc15","int a; n0: { a +=1; }; void f();");

//{'p9p13'}
test bool tc16() = testCase("tc16","int a; n0: for (int i := a) { break n0; }; n0: for (int i := a) { append i; }");

//{'p15p17'}
test bool tc17() = testCase("tc17","int a; dynamic int b1;; a = a + 0;");

//{'p3p5'}
test bool tc18() = testCase("tc18","int a; n0: do { a += 1; } while (a==0);; n0: if (a == 0) { a += 1; }");

//{'p4p10'}
test bool tc19() = testCase("tc19","int a; n0: for (int i := a) { a += 1; }; n0: for (int i := a) { continue n0; }");

//{'p7p13'}
test bool tc20() = testCase("tc20","int a; n0: switch(a) { case int i : a +=1; }; n0: for (int i := a) { append i; }");

//{'p10p12'}
test bool tc21() = testCase("tc21","int a; n0: for (int i := a) { continue n0; }; n0: top-down visit(a) { case int i : insert i; }");

//{'p11p19'}
test bool tc22() = testCase("tc22","int a; n0: { a +=1; }; int b4=0;");

//{'p3p4'}
test bool tc23() = testCase("tc23","int a; n0: do { a += 1; } while (a==0);; n0: for (int i := a) { a += 1; }");

//{'p2p6'}
test bool tc24() = testCase("tc24","int a; n0: while(a==0) { a += 1; }; n0: if (a == 0) { a += 1; } else { a +=1; }");

//{'p14p16'}
test bool tc25() = testCase("tc25","int a; int b0;; int b2,b3;");

//{'p2p7'}
test bool tc26() = testCase("tc26","int a; n0: while(a==0) { a += 1; }; n0: switch(a) { case int i : a +=1; }");

//{'p10p18'}
test bool tc27() = testCase("tc27","int a; n0: for (int i := a) { continue n0; }; a;");

//{'p2p9'}
test bool tc28() = testCase("tc28","int a; n0: while(a==0) { a += 1; }; n0: for (int i := a) { break n0; }");

//{'p1p18'}
test bool tc29() = testCase("tc29","int a; n0: top-down visit(a) { case int i =\> i }; a;");

//{'p4p9'}
test bool tc30() = testCase("tc30","int a; n0: for (int i := a) { a += 1; }; n0: for (int i := a) { break n0; }");

//{'p14p15'}
test bool tc31() = testCase("tc31","int a; int b0;; dynamic int b1;");

//{'p7p15'}
test bool tc32() = testCase("tc32","int a; n0: switch(a) { case int i : a +=1; }; dynamic int b1;");

//{'p13p17'}
test bool tc33() = testCase("tc33","int a; n0: for (int i := a) { append i; }; a = a + 0;");

//{'p2p3'}
test bool tc34() = testCase("tc34","int a; n0: while(a==0) { a += 1; }; n0: do { a += 1; } while (a==0);");

//{'p15p19'}
test bool tc35() = testCase("tc35","int a; dynamic int b1;; int b4=0;");

//{'p13p14'}
test bool tc36() = testCase("tc36","int a; n0: for (int i := a) { append i; }; int b0;");

//{'p4p15'}
test bool tc37() = testCase("tc37","int a; n0: for (int i := a) { a += 1; }; dynamic int b1;");

//{'p7p11'}
test bool tc38() = testCase("tc38","int a; n0: switch(a) { case int i : a +=1; }; n0: { a +=1; }");

//{'p6p1','p6p10','p6p11','p6p12','p6p13','p6p14','p6p15','p6p16','p6p17','p6p18','p6p19','p6p2','p6p3','p6p4','p6p5','p6p7','p6p8','p6p9'}
test bool tc39() = testCase("tc39","int a; n0: if (a == 0) { a += 1; } else { a +=1; }; void f();");

//{'p1p19'}
test bool tc40() = testCase("tc40","int a; n0: top-down visit(a) { case int i =\> i }; int b4=0;");

//{'p2p14'}
test bool tc41() = testCase("tc41","int a; n0: while(a==0) { a += 1; }; int b0;");

//{'p3p13'}
test bool tc42() = testCase("tc42","int a; n0: do { a += 1; } while (a==0);; n0: for (int i := a) { append i; }");

//{'p17p19'}
test bool tc43() = testCase("tc43","int a; a = a + 0;; int b4=0;");

//{'p6p8'}
test bool tc44() = testCase("tc44","int a; n0: if (a == 0) { a += 1; } else { a +=1; }; n0: for (int i := a) { fail n0; }");

//{'p2p5'}
test bool tc45() = testCase("tc45","int a; n0: while(a==0) { a += 1; }; n0: if (a == 0) { a += 1; }");

//{'p13p15'}
test bool tc46() = testCase("tc46","int a; n0: for (int i := a) { append i; }; dynamic int b1;");

//{'p11p16'}
test bool tc47() = testCase("tc47","int a; n0: { a +=1; }; int b2,b3;");

//{'p6p15'}
test bool tc48() = testCase("tc48","int a; n0: if (a == 0) { a += 1; } else { a +=1; }; dynamic int b1;");

//{'p5p19'}
test bool tc49() = testCase("tc49","int a; n0: if (a == 0) { a += 1; }; int b4=0;");

//{'p9p12'}
test bool tc50() = testCase("tc50","int a; n0: for (int i := a) { break n0; }; n0: top-down visit(a) { case int i : insert i; }");

//{'p4p11'}
test bool tc51() = testCase("tc51","int a; n0: for (int i := a) { a += 1; }; n0: { a +=1; }");

//{'p6p10'}
test bool tc52() = testCase("tc52","int a; n0: if (a == 0) { a += 1; } else { a +=1; }; n0: for (int i := a) { continue n0; }");

//{'p10p11'}
test bool tc53() = testCase("tc53","int a; n0: for (int i := a) { continue n0; }; n0: { a +=1; }");

//{'p4p19'}
test bool tc54() = testCase("tc54","int a; n0: for (int i := a) { a += 1; }; int b4=0;");

//{'p2p10'}
test bool tc55() = testCase("tc55","int a; n0: while(a==0) { a += 1; }; n0: for (int i := a) { continue n0; }");

//{'p2p11'}
test bool tc56() = testCase("tc56","int a; n0: while(a==0) { a += 1; }; n0: { a +=1; }");

//{'p12p15'}
test bool tc57() = testCase("tc57","int a; n0: top-down visit(a) { case int i : insert i; }; dynamic int b1;");

//{'p7p17'}
test bool tc58() = testCase("tc58","int a; n0: switch(a) { case int i : a +=1; }; a = a + 0;");

//{'p7p1','p7p10','p7p11','p7p12','p7p13','p7p14','p7p15','p7p16','p7p17','p7p18','p7p19','p7p2','p7p3','p7p4','p7p5','p7p6','p7p8','p7p9'}
test bool tc59() = testCase("tc59","int a; n0: switch(a) { case int i : a +=1; }; void f();");

//{'p3p19'}
test bool tc60() = testCase("tc60","int a; n0: do { a += 1; } while (a==0);; int b4=0;");

//{'p1p7'}
test bool tc61() = testCase("tc61","int a; n0: top-down visit(a) { case int i =\> i }; n0: switch(a) { case int i : a +=1; }");

//{'p5p16'}
test bool tc62() = testCase("tc62","int a; n0: if (a == 0) { a += 1; }; int b2,b3;");

//{'p4p14'}
test bool tc63() = testCase("tc63","int a; n0: for (int i := a) { a += 1; }; int b0;");

//{'p9p18'}
test bool tc64() = testCase("tc64","int a; n0: for (int i := a) { break n0; }; a;");

//{'p6p12'}
test bool tc65() = testCase("tc65","int a; n0: if (a == 0) { a += 1; } else { a +=1; }; n0: top-down visit(a) { case int i : insert i; }");

//{'p2p13'}
test bool tc66() = testCase("tc66","int a; n0: while(a==0) { a += 1; }; n0: for (int i := a) { append i; }");

//{'p15p1','p15p10','p15p11','p15p12','p15p13','p15p14','p15p16','p15p17','p15p18','p15p19','p15p2','p15p3','p15p4','p15p5','p15p6','p15p7','p15p8','p15p9'}
test bool tc67() = testCase("tc67","int a; dynamic int b1;; void f();");

//{'p2p17'}
test bool tc68() = testCase("tc68","int a; n0: while(a==0) { a += 1; }; a = a + 0;");

//{'p7p8'}
test bool tc69() = testCase("tc69","int a; n0: switch(a) { case int i : a +=1; }; n0: for (int i := a) { fail n0; }");

//{'p4p17'}
test bool tc70() = testCase("tc70","int a; n0: for (int i := a) { a += 1; }; a = a + 0;");

//{'p14p17'}
test bool tc71() = testCase("tc71","int a; int b0;; a = a + 0;");

//{'p7p12'}
test bool tc72() = testCase("tc72","int a; n0: switch(a) { case int i : a +=1; }; n0: top-down visit(a) { case int i : insert i; }");

//{'p5p12'}
test bool tc73() = testCase("tc73","int a; n0: if (a == 0) { a += 1; }; n0: top-down visit(a) { case int i : insert i; }");

//{'p3p16'}
test bool tc74() = testCase("tc74","int a; n0: do { a += 1; } while (a==0);; int b2,b3;");

//{'p2p18'}
test bool tc75() = testCase("tc75","int a; n0: while(a==0) { a += 1; }; a;");

//{'p1p16'}
test bool tc76() = testCase("tc76","int a; n0: top-down visit(a) { case int i =\> i }; int b2,b3;");

//{'p16p1','p16p10','p16p11','p16p12','p16p13','p16p14','p16p15','p16p17','p16p18','p16p19','p16p2','p16p3','p16p4','p16p5','p16p6','p16p7','p16p8','p16p9'}
test bool tc77() = testCase("tc77","int a; int b2,b3;; void f();");

//{'p10p13'}
test bool tc78() = testCase("tc78","int a; n0: for (int i := a) { continue n0; }; n0: for (int i := a) { append i; }");

//{'p5p11'}
test bool tc79() = testCase("tc79","int a; n0: if (a == 0) { a += 1; }; n0: { a +=1; }");

//{'p6p11'}
test bool tc80() = testCase("tc80","int a; n0: if (a == 0) { a += 1; } else { a +=1; }; n0: { a +=1; }");

//{'p8p11'}
test bool tc81() = testCase("tc81","int a; n0: for (int i := a) { fail n0; }; n0: { a +=1; }");

//{'p9p19'}
test bool tc82() = testCase("tc82","int a; n0: for (int i := a) { break n0; }; int b4=0;");

//{'p5p7'}
test bool tc83() = testCase("tc83","int a; n0: if (a == 0) { a += 1; }; n0: switch(a) { case int i : a +=1; }");

//{'p1p5'}
test bool tc84() = testCase("tc84","int a; n0: top-down visit(a) { case int i =\> i }; n0: if (a == 0) { a += 1; }");

//{'p8p10'}
test bool tc85() = testCase("tc85","int a; n0: for (int i := a) { fail n0; }; n0: for (int i := a) { continue n0; }");

//{'p5p14'}
test bool tc86() = testCase("tc86","int a; n0: if (a == 0) { a += 1; }; int b0;");

//{'p9p17'}
test bool tc87() = testCase("tc87","int a; n0: for (int i := a) { break n0; }; a = a + 0;");

//{'p18p19'}
test bool tc88() = testCase("tc88","int a; a;; int b4=0;");

//{'p6p17'}
test bool tc89() = testCase("tc89","int a; n0: if (a == 0) { a += 1; } else { a +=1; }; a = a + 0;");

//{'p5p9'}
test bool tc90() = testCase("tc90","int a; n0: if (a == 0) { a += 1; }; n0: for (int i := a) { break n0; }");

//{'p6p19'}
test bool tc91() = testCase("tc91","int a; n0: if (a == 0) { a += 1; } else { a +=1; }; int b4=0;");

//{'p10p14'}
test bool tc92() = testCase("tc92","int a; n0: for (int i := a) { continue n0; }; int b0;");

//{'p3p10'}
test bool tc93() = testCase("tc93","int a; n0: do { a += 1; } while (a==0);; n0: for (int i := a) { continue n0; }");

//{'p4p16'}
test bool tc94() = testCase("tc94","int a; n0: for (int i := a) { a += 1; }; int b2,b3;");

//{'p3p14'}
test bool tc95() = testCase("tc95","int a; n0: do { a += 1; } while (a==0);; int b0;");

//{'p5p18'}
test bool tc96() = testCase("tc96","int a; n0: if (a == 0) { a += 1; }; a;");

//{'p16p19'}
test bool tc97() = testCase("tc97","int a; int b2,b3;; int b4=0;");

//{'p10p16'}
test bool tc98() = testCase("tc98","int a; n0: for (int i := a) { continue n0; }; int b2,b3;");

//{'p10p15'}
test bool tc99() = testCase("tc99","int a; n0: for (int i := a) { continue n0; }; dynamic int b1;");

//{'p7p10'}
test bool tc100() = testCase("tc100","int a; n0: switch(a) { case int i : a +=1; }; n0: for (int i := a) { continue n0; }");

//{'p4p8'}
test bool tc101() = testCase("tc101","int a; n0: for (int i := a) { a += 1; }; n0: for (int i := a) { fail n0; }");

//{'p11p18'}
test bool tc102() = testCase("tc102","int a; n0: { a +=1; }; a;");

//{'p4p12'}
test bool tc103() = testCase("tc103","int a; n0: for (int i := a) { a += 1; }; n0: top-down visit(a) { case int i : insert i; }");

//{'p12p14'}
test bool tc104() = testCase("tc104","int a; n0: top-down visit(a) { case int i : insert i; }; int b0;");

//{'p12p16'}
test bool tc105() = testCase("tc105","int a; n0: top-down visit(a) { case int i : insert i; }; int b2,b3;");

//{'p5p17'}
test bool tc106() = testCase("tc106","int a; n0: if (a == 0) { a += 1; }; a = a + 0;");

//{'p18p1','p18p10','p18p11','p18p12','p18p13','p18p14','p18p15','p18p16','p18p17','p18p19','p18p2','p18p3','p18p4','p18p5','p18p6','p18p7','p18p8','p18p9'}
test bool tc107() = testCase("tc107","int a; a;; void f();");

//{'p2p15'}
test bool tc108() = testCase("tc108","int a; n0: while(a==0) { a += 1; }; dynamic int b1;");

//{'p5p10'}
test bool tc109() = testCase("tc109","int a; n0: if (a == 0) { a += 1; }; n0: for (int i := a) { continue n0; }");

//{'p8p16'}
test bool tc110() = testCase("tc110","int a; n0: for (int i := a) { fail n0; }; int b2,b3;");

//{'p9p11'}
test bool tc111() = testCase("tc111","int a; n0: for (int i := a) { break n0; }; n0: { a +=1; }");

//{'p7p14'}
test bool tc112() = testCase("tc112","int a; n0: switch(a) { case int i : a +=1; }; int b0;");

//{'p5p15'}
test bool tc113() = testCase("tc113","int a; n0: if (a == 0) { a += 1; }; dynamic int b1;");

//{'p3p12'}
test bool tc114() = testCase("tc114","int a; n0: do { a += 1; } while (a==0);; n0: top-down visit(a) { case int i : insert i; }");

//{'p8p9'}
test bool tc115() = testCase("tc115","int a; n0: for (int i := a) { fail n0; }; n0: for (int i := a) { break n0; }");

//{'p8p14'}
test bool tc116() = testCase("tc116","int a; n0: for (int i := a) { fail n0; }; int b0;");

//{'p3p9'}
test bool tc117() = testCase("tc117","int a; n0: do { a += 1; } while (a==0);; n0: for (int i := a) { break n0; }");

//{'p1p10'}
test bool tc118() = testCase("tc118","int a; n0: top-down visit(a) { case int i =\> i }; n0: for (int i := a) { continue n0; }");

//{'p8p19'}
test bool tc119() = testCase("tc119","int a; n0: for (int i := a) { fail n0; }; int b4=0;");

//{'p1p15'}
test bool tc120() = testCase("tc120","int a; n0: top-down visit(a) { case int i =\> i }; dynamic int b1;");

//{'p1p17'}
test bool tc121() = testCase("tc121","int a; n0: top-down visit(a) { case int i =\> i }; a = a + 0;");

//{'p8p13'}
test bool tc122() = testCase("tc122","int a; n0: for (int i := a) { fail n0; }; n0: for (int i := a) { append i; }");

//{'p13p16'}
test bool tc123() = testCase("tc123","int a; n0: for (int i := a) { append i; }; int b2,b3;");

//{'p1p13'}
test bool tc124() = testCase("tc124","int a; n0: top-down visit(a) { case int i =\> i }; n0: for (int i := a) { append i; }");

//{'p6p9'}
test bool tc125() = testCase("tc125","int a; n0: if (a == 0) { a += 1; } else { a +=1; }; n0: for (int i := a) { break n0; }");

//{'p1p3'}
test bool tc126() = testCase("tc126","int a; n0: top-down visit(a) { case int i =\> i }; n0: do { a += 1; } while (a==0);");

//{'p1p12'}
test bool tc127() = testCase("tc127","int a; n0: top-down visit(a) { case int i =\> i }; n0: top-down visit(a) { case int i : insert i; }");

//{'p3p17'}
test bool tc128() = testCase("tc128","int a; n0: do { a += 1; } while (a==0);; a = a + 0;");

//{'p5p8'}
test bool tc129() = testCase("tc129","int a; n0: if (a == 0) { a += 1; }; n0: for (int i := a) { fail n0; }");

//{'p11p13'}
test bool tc130() = testCase("tc130","int a; n0: { a +=1; }; n0: for (int i := a) { append i; }");

//{'p3p18'}
test bool tc131() = testCase("tc131","int a; n0: do { a += 1; } while (a==0);; a;");

//{'p8p17'}
test bool tc132() = testCase("tc132","int a; n0: for (int i := a) { fail n0; }; a = a + 0;");

//{'p11p17'}
test bool tc133() = testCase("tc133","int a; n0: { a +=1; }; a = a + 0;");

//{'p6p16'}
test bool tc134() = testCase("tc134","int a; n0: if (a == 0) { a += 1; } else { a +=1; }; int b2,b3;");

//{'p2p19'}
test bool tc135() = testCase("tc135","int a; n0: while(a==0) { a += 1; }; int b4=0;");

//{'p3p1','p3p10','p3p11','p3p12','p3p13','p3p14','p3p15','p3p16','p3p17','p3p18','p3p19','p3p2','p3p4','p3p5','p3p6','p3p7','p3p8','p3p9'}
test bool tc136() = testCase("tc136","int a; n0: do { a += 1; } while (a==0);; void f();");

//{'p3p6'}
test bool tc137() = testCase("tc137","int a; n0: do { a += 1; } while (a==0);; n0: if (a == 0) { a += 1; } else { a +=1; }");

//{'p7p9'}
test bool tc138() = testCase("tc138","int a; n0: switch(a) { case int i : a +=1; }; n0: for (int i := a) { break n0; }");

//{'p4p6'}
test bool tc139() = testCase("tc139","int a; n0: for (int i := a) { a += 1; }; n0: if (a == 0) { a += 1; } else { a +=1; }");

//{'p19p1','p19p10','p19p11','p19p12','p19p13','p19p14','p19p15','p19p16','p19p17','p19p18','p19p2','p19p3','p19p4','p19p5','p19p6','p19p7','p19p8','p19p9'}
test bool tc140() = testCase("tc140","int a; int b4=0;; void f();");

//{'p8p1','p8p10','p8p11','p8p12','p8p13','p8p14','p8p15','p8p16','p8p17','p8p18','p8p19','p8p2','p8p3','p8p4','p8p5','p8p6','p8p7','p8p9'}
test bool tc141() = testCase("tc141","int a; n0: for (int i := a) { fail n0; }; void f();");

//{'p15p16'}
test bool tc142() = testCase("tc142","int a; dynamic int b1;; int b2,b3;");

//{'p13p19'}
test bool tc143() = testCase("tc143","int a; n0: for (int i := a) { append i; }; int b4=0;");

//{'p9p10'}
test bool tc144() = testCase("tc144","int a; n0: for (int i := a) { break n0; }; n0: for (int i := a) { continue n0; }");

//{'p17p1','p17p10','p17p11','p17p12','p17p13','p17p14','p17p15','p17p16','p17p18','p17p19','p17p2','p17p3','p17p4','p17p5','p17p6','p17p7','p17p8','p17p9'}
test bool tc145() = testCase("tc145","int a; a = a + 0;; void f();");

//{'p4p13'}
test bool tc146() = testCase("tc146","int a; n0: for (int i := a) { a += 1; }; n0: for (int i := a) { append i; }");

//{'p9p14'}
test bool tc147() = testCase("tc147","int a; n0: for (int i := a) { break n0; }; int b0;");

//{'p5p1','p5p10','p5p11','p5p12','p5p13','p5p14','p5p15','p5p16','p5p17','p5p18','p5p19','p5p2','p5p3','p5p4','p5p6','p5p7','p5p8','p5p9'}
test bool tc148() = testCase("tc148","int a; n0: if (a == 0) { a += 1; }; void f();");

//{'p4p18'}
test bool tc149() = testCase("tc149","int a; n0: for (int i := a) { a += 1; }; a;");

//{'p1p11'}
test bool tc150() = testCase("tc150","int a; n0: top-down visit(a) { case int i =\> i }; n0: { a +=1; }");

//{'p4p7'}
test bool tc151() = testCase("tc151","int a; n0: for (int i := a) { a += 1; }; n0: switch(a) { case int i : a +=1; }");

//{'p16p17'}
test bool tc152() = testCase("tc152","int a; int b2,b3;; a = a + 0;");

//{'p9p15'}
test bool tc153() = testCase("tc153","int a; n0: for (int i := a) { break n0; }; dynamic int b1;");

//{'p9p1','p9p10','p9p11','p9p12','p9p13','p9p14','p9p15','p9p16','p9p17','p9p18','p9p19','p9p2','p9p3','p9p4','p9p5','p9p6','p9p7','p9p8'}
test bool tc154() = testCase("tc154","int a; n0: for (int i := a) { break n0; }; void f();");

//{'p10p17'}
test bool tc155() = testCase("tc155","int a; n0: for (int i := a) { continue n0; }; a = a + 0;");

//{'p12p17'}
test bool tc156() = testCase("tc156","int a; n0: top-down visit(a) { case int i : insert i; }; a = a + 0;");

//{'p2p1','p2p10','p2p11','p2p12','p2p13','p2p14','p2p15','p2p16','p2p17','p2p18','p2p19','p2p3','p2p4','p2p5','p2p6','p2p7','p2p8','p2p9'}
test bool tc157() = testCase("tc157","int a; n0: while(a==0) { a += 1; }; void f();");

//{'p11p12'}
test bool tc158() = testCase("tc158","int a; n0: { a +=1; }; n0: top-down visit(a) { case int i : insert i; }");

//{'p6p14'}
test bool tc159() = testCase("tc159","int a; n0: if (a == 0) { a += 1; } else { a +=1; }; int b0;");

//{'p2p8'}
test bool tc160() = testCase("tc160","int a; n0: while(a==0) { a += 1; }; n0: for (int i := a) { fail n0; }");

//{'p11p14'}
test bool tc161() = testCase("tc161","int a; n0: { a +=1; }; int b0;");

//{'p11p15'}
test bool tc162() = testCase("tc162","int a; n0: { a +=1; }; dynamic int b1;");

//{'p12p19'}
test bool tc163() = testCase("tc163","int a; n0: top-down visit(a) { case int i : insert i; }; int b4=0;");

//{'p3p15'}
test bool tc164() = testCase("tc164","int a; n0: do { a += 1; } while (a==0);; dynamic int b1;");

//{'p6p7'}
test bool tc165() = testCase("tc165","int a; n0: if (a == 0) { a += 1; } else { a +=1; }; n0: switch(a) { case int i : a +=1; }");

//{'p3p7'}
test bool tc166() = testCase("tc166","int a; n0: do { a += 1; } while (a==0);; n0: switch(a) { case int i : a +=1; }");

//{'p10p11','p10p12','p10p13','p10p14','p10p15','p10p16','p10p17','p10p18','p10p19','p11p12','p11p13','p11p14','p11p15','p11p16','p11p17','p11p18','p11p19','p12p13','p12p14','p12p15','p12p16','p12p17','p12p18','p12p19','p13p14','p13p15','p13p16','p13p17','p13p18','p13p19','p14p15','p14p16','p14p17','p14p18','p14p19','p15p16','p15p17','p15p18','p15p19','p16p17','p16p18','p16p19','p17p18','p17p19','p18p19','p1p10','p1p11','p1p12','p1p13','p1p14','p1p15','p1p16','p1p17','p1p18','p1p19','p1p2','p1p3','p1p4','p1p5','p1p6','p1p7','p1p8','p1p9','p2p10','p2p11','p2p12','p2p13','p2p14','p2p15','p2p16','p2p17','p2p18','p2p19','p2p3','p2p4','p2p5','p2p6','p2p7','p2p8','p2p9','p3p10','p3p11','p3p12','p3p13','p3p14','p3p15','p3p16','p3p17','p3p18','p3p19','p3p4','p3p5','p3p6','p3p7','p3p8','p3p9','p4p10','p4p11','p4p12','p4p13','p4p14','p4p15','p4p16','p4p17','p4p18','p4p19','p4p5','p4p6','p4p7','p4p8','p4p9','p5p10','p5p11','p5p12','p5p13','p5p14','p5p15','p5p16','p5p17','p5p18','p5p19','p5p6','p5p7','p5p8','p5p9','p6p10','p6p11','p6p12','p6p13','p6p14','p6p15','p6p16','p6p17','p6p18','p6p19','p6p7','p6p8','p6p9','p7p10','p7p11','p7p12','p7p13','p7p14','p7p15','p7p16','p7p17','p7p18','p7p19','p7p8','p7p9','p8p10','p8p11','p8p12','p8p13','p8p14','p8p15','p8p16','p8p17','p8p18','p8p19','p8p9','p9p10','p9p11','p9p12','p9p13','p9p14','p9p15','p9p16','p9p17','p9p18','p9p19'}
test bool tc167() = testCase("tc167","int a; void f();");

//{'p10p1','p10p11','p10p12','p10p13','p10p14','p10p15','p10p16','p10p17','p10p18','p10p19','p10p2','p10p3','p10p4','p10p5','p10p6','p10p7','p10p8','p10p9'}
test bool tc168() = testCase("tc168","int a; n0: for (int i := a) { continue n0; }; void f();");

//{'p7p16'}
test bool tc169() = testCase("tc169","int a; n0: switch(a) { case int i : a +=1; }; int b2,b3;");

//{'p1p9'}
test bool tc170() = testCase("tc170","int a; n0: top-down visit(a) { case int i =\> i }; n0: for (int i := a) { break n0; }");

//{'p4p5'}
test bool tc171() = testCase("tc171","int a; n0: for (int i := a) { a += 1; }; n0: if (a == 0) { a += 1; }");

//{'p1p4'}
test bool tc172() = testCase("tc172","int a; n0: top-down visit(a) { case int i =\> i }; n0: for (int i := a) { a += 1; }");

//{'p14p18'}
test bool tc173() = testCase("tc173","int a; int b0;; a;");

//{'p1p8'}
test bool tc174() = testCase("tc174","int a; n0: top-down visit(a) { case int i =\> i }; n0: for (int i := a) { fail n0; }");

//{'p14p1','p14p10','p14p11','p14p12','p14p13','p14p15','p14p16','p14p17','p14p18','p14p19','p14p2','p14p3','p14p4','p14p5','p14p6','p14p7','p14p8','p14p9'}
test bool tc175() = testCase("tc175","int a; int b0;; void f();");

//{'p8p18'}
test bool tc176() = testCase("tc176","int a; n0: for (int i := a) { fail n0; }; a;");

//{'p1p2'}
test bool tc177() = testCase("tc177","int a; n0: top-down visit(a) { case int i =\> i }; n0: while(a==0) { a += 1; }");

//{'p12p18'}
test bool tc178() = testCase("tc178","int a; n0: top-down visit(a) { case int i : insert i; }; a;");

//{'p2p4'}
test bool tc179() = testCase("tc179","int a; n0: while(a==0) { a += 1; }; n0: for (int i := a) { a += 1; }");

//{'p6p13'}
test bool tc180() = testCase("tc180","int a; n0: if (a == 0) { a += 1; } else { a +=1; }; n0: for (int i := a) { append i; }");

//{'p7p18'}
test bool tc181() = testCase("tc181","int a; n0: switch(a) { case int i : a +=1; }; a;");

//{'p12p1','p12p10','p12p11','p12p13','p12p14','p12p15','p12p16','p12p17','p12p18','p12p19','p12p2','p12p3','p12p4','p12p5','p12p6','p12p7','p12p8','p12p9'}
test bool tc182() = testCase("tc182","int a; n0: top-down visit(a) { case int i : insert i; }; void f();");

//{'p3p11'}
test bool tc183() = testCase("tc183","int a; n0: do { a += 1; } while (a==0);; n0: { a +=1; }");

//{'p10p19'}
test bool tc184() = testCase("tc184","int a; n0: for (int i := a) { continue n0; }; int b4=0;");

//{'p17p18'}
test bool tc185() = testCase("tc185","int a; a = a + 0;; a;");

//{'p8p12'}
test bool tc186() = testCase("tc186","int a; n0: for (int i := a) { fail n0; }; n0: top-down visit(a) { case int i : insert i; }");

//{'p14p19'}
test bool tc187() = testCase("tc187","int a; int b0;; int b4=0;");

//{'p1p10','p1p11','p1p12','p1p13','p1p14','p1p15','p1p16','p1p17','p1p18','p1p19','p1p2','p1p3','p1p4','p1p5','p1p6','p1p7','p1p8','p1p9'}
test bool tc188() = testCase("tc188","int a; n0: top-down visit(a) { case int i =\> i }; void f();");

//{'p1p14'}
test bool tc189() = testCase("tc189","int a; n0: top-down visit(a) { case int i =\> i }; int b0;");

//{'p8p15'}
test bool tc190() = testCase("tc190","int a; n0: for (int i := a) { fail n0; }; dynamic int b1;");

//{'p6p18'}
test bool tc191() = testCase("tc191","int a; n0: if (a == 0) { a += 1; } else { a +=1; }; a;");

