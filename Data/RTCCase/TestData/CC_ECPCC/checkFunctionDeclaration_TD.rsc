module chkFunc_EC

import TestUtil;

//p1 -> p6444

//{'p1'}
test bool tc1() = tcModule("tc1","public void f() { int a; }");

//{'p1'}
test bool tc2() = tcModule("tc2","public int a;");

