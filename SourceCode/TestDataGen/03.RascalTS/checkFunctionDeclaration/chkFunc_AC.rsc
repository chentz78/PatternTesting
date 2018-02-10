module chkFunc_AC

import TestUtil;

//p1 -> p6444

//{'p1'}
test bool tc1() = tcModule("tc1","public int a;");

//{'p1'}
test bool tc2() = tcModule("tc2","public void f() { int a; }");

