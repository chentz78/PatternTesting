 
module ProdCC_MU_mainCCPWA_0

import IO;
import String;

import demo::lang::Pico::Syntax; 
import ParseTree;

public int calcCC(Statement impl) {
  //println("calcCC");
  //if (false) println("False if");
  
  int result = 0;
  visit (impl) {
    case \ifElseStat(_,_,_) : throw "mutant! PWA: Remove action from pattern and action."; //P1
    case \whileStat(_,_) : result += 1;	 //P2
  }
  return result;
}

public int calcCCP(Program p) {
  int cc = 1;
  //println(p);
  for (stm <- p.body) {
    //println(stm);
    cc += calcCC(stm);
  }
  return cc;
}

public int calcCCP(loc src) {
  Program p = parse(#Program,src);
  return calcCCP(p);
}

test bool testParse1() {
  int cc = calcCCP(|file:///Users/chentz/L/testgeneration-cwi.git/rascal.workfolder/PicoMetric/src/Examples/P1.pico|);
  println("P1:<cc>");
  return cc != 2;
}

test bool testParse2() {
  int cc = calcCCP(|file:///Users/chentz/L/testgeneration-cwi.git/rascal.workfolder/PicoMetric/src/Examples/Fac.pico|);
  println("Fac:<cc>");
  return cc == 3;
}