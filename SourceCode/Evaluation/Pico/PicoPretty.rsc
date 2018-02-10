module PicoPretty

import IO;
import String;

import demo::lang::Pico::Syntax; 
import ParseTree;

//Aux
private str unfoldZero(&T struc, str prefix="  ", str sep=",\n", bool prettyElement = false) {
 str ret = "";
 bool first = true;
 str eUse;
 for (e <- struc) {
   eUse = prettyElement ? "<pretty(e)>" : "<e>";
   if (first) {
     ret = "<prefix><eUse>";
     first = false;
   } else {
     ret = "<ret><sep><prefix><eUse>";
   }
 }
 return ret;
}

//lexical symbols
public str pretty(Id v) = "<v>";
public str pretty(Natural v) = "<v>";
public str pretty(String v) = "<v>";

//CFG Rules
//Expression
public str pretty(Expression v) = "<v>";

public str pretty(Declarations v) = "declare\n<unfoldZero(v.decls)>;";

//Statment
public str pretty(Statement v) = "if <pretty(v.cond)> then
'  <unfoldZero(v.thenPart,prefix="",sep=";\n",prettyElement=true)>
'else
'  <unfoldZero(v.elsePart,prefix="",sep=";\n",prettyElement=true)>
'fi" when (v has elsePart);

public str pretty(Statement v) = "if <pretty(v.cond)> then
'  <unfoldZero(v.thenPart,prefix="",sep=";\n",prettyElement=true)>
'fi" when (v has thenPart && !(v has elsePart) );

public str pretty(Statement v) = "while <pretty(v.cond)> do
'  <unfoldZero(v.body,prefix="",sep=";\n",prettyElement=true)>
'od" when (v has body);

public str pretty(Statement v) = "<v>" when !(v has thenPart);

//public str pretty(Statement v) = "<v>";

public str pretty(program(d, b*)) = "begin
'  <pretty(d)>
'  <unfoldZero(b,prefix="",sep=";\n",prettyElement=true)>
'end";

public str pretty(loc src) {
  p = parse(#Program,src);
	
  str d = pretty(p);
  //println(d);
  return d;
}

public bool pretty(loc src, loc dst) {
  str ret = pretty(src);
  writeFile(dst, ret);
  return true;
}

loc tProg1 = |file:///Users/chentz/L/testgeneration-cwi.git/rascal.workfolder/PicoMetric/src/Examples/P1.pico|;
loc tProg2 = |file:///Users/chentz/L/testgeneration-cwi.git/rascal.workfolder/PicoMetric/src/Examples/LineProgram.pico|;

test bool t1() = !isEmpty(pretty(tProg1));
test bool t2() = !isEmpty(pretty(tProg2));
test bool t3() { program(pretty(tProg1)); return true;}