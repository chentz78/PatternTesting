module rascalModInfo

import IO;
import String;

import util::Reflective;
import lang::rascal::\syntax::Rascal;

import searchRascal;

map[str,int] checkTest(Module m) {
  int fCount=0;
  int fAbs=0;
  int cTest=0;
  for (/FunctionDeclaration f := m) {
    fCount+=1;
    
    visit (f) {
      case FunctionModifier fd: { if (fd is \test) cTest+=1; }
      case \abstract(_,_,_) : {fAbs+=1;}
    }
  }
  fCount-=cTest; 
  return ("funcCount":fCount,
          "funcWImple":fCount-fAbs,
          "funcAbs":fAbs,
          "test":cTest);
}

private loc sRascalTC = |home:///L/rascal-build/rascal/src/org/rascalmpl/library/lang/rascal/types/CheckTypes.rsc|;
private loc sJavaCC = |home:///L/testgeneration-cwi.git/rascal.workfolder/JavaMetric/src/JDTCC.rsc|;

public void printInfo(loc modFile) {
  rMap = srcCode(modFile, checkTest);
  for (e <- rMap) {
    println("<e>:<rMap[e]>");
  }
}

public void main() {
  println("Load OK");
  sample = sRascalTC;
  printInfo(sample);
}