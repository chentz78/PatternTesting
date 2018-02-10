module build_Patt

import TestUtil;

//p1 -> p5221
//p2 -> p5266
//p3 -> p5269
//p4 -> p5300
//p5 -> p5306

//{'p4','p5'}
test bool tc1() = testCase("tc1","list[int] a = []; a[0,0..0] = []; ");

//{'p1'}
test bool tc2() = testCase("tc2","list[int] a = []; a[0] = 0; ");

//{'p2','p3'}
test bool tc3() = testCase("tc3","list[int] a = []; a[0..0] = []; ");

