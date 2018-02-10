module build_AC

import TestUtil;

//p1 -> p5221
//p2 -> p5266
//p3 -> p5269
//p4 -> p5300
//p5 -> p5306

//{'p4\p1\p2\p3\p5','p4p5\p1\p2\p3','p5\p1\p2\p3\p4'}
test bool tc1() = testCase("tc1","list[int] a = []; a[0,0..0] = []; a[0+1] = 0; int b; b = 0; ");

//{'p1\p2\p3\p4\p5'}
test bool tc2() = testCase("tc2","list[int] a = []; a[0] = 0; int b; b = 0; ");

//{'p1p2\p3\p4\p5','p1p2p3\p4\p5','p1p3\p2\p4\p5'}
test bool tc3() = testCase("tc3","list[int] a = []; a[0] = 0; a[0..0] = []; int b; b = 0; ");

//{'p1p2p3p4p5'}
test bool tc4() = testCase("tc4","list[int] a = []; a[0] = 0; a[0..0] = []; a[0,0..0] = []; ");

//{'p1p4\p2\p3\p5','p1p4p5\p2\p3','p1p5\p2\p3\p4'}
test bool tc5() = testCase("tc5","list[int] a = []; a[0] = 0; a[0,0..0] = []; int b; b = 0; ");

//{'\p1\p2\p3\p4\p5'}
test bool tc6() = testCase("tc6","list[int] a = []; a[0+1] = 0; int b; b = 0; ");

//{'p2p3p4p5\p1'}
test bool tc7() = testCase("tc7","list[int] a = []; a[0..0] = []; a[0,0..0] = []; a[0+1] = 0; ");

//{'p1p2p3p4\p5','p1p2p3p5\p4','p1p2p4\p3\p5','p1p2p4p5\p3','p1p2p5\p3\p4','p1p3p4\p2\p5','p1p3p4p5\p2','p1p3p5\p2\p4'}
test bool tc8() = testCase("tc8","list[int] a = []; a[0] = 0; a[0..0] = []; a[0,0..0] = []; int b; b = 0; ");

//{'p2p3p4\p1\p5','p2p3p5\p1\p4','p2p4\p1\p3\p5','p2p4p5\p1\p3','p2p5\p1\p3\p4','p3p4\p1\p2\p5','p3p4p5\p1\p2','p3p5\p1\p2\p4'}
test bool tc9() = testCase("tc9","list[int] a = []; a[0..0] = []; a[0,0..0] = []; a[0+1] = 0; int b; b = 0; ");

//{'p2\p1\p3\p4\p5','p2p3\p1\p4\p5','p3\p1\p2\p4\p5'}
test bool tc10() = testCase("tc10","list[int] a = []; a[0..0] = []; a[0+1] = 0; int b; b = 0; ");

