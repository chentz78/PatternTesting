@bootstrapParser
@doc{
Synopsis: Mutant Generator for Rascal modules

Description:  This module contains tools to automatically generate broken mutations from a working 
  Rascal module. The use case is to test how good the tests are for such a module. The tests
  should be able to find the bugs we introduce using the mutators.
  
Examples

<listing>
import lang::rascal::mutation::ModuleMutator;
mutate(|project://rascal/src/org/rascalmpl/library/lang/rascal/format/Grammar.rsc|, mutations=5)
</listing>  
}
//module lang::rascal::mutation::ModuleMutator
module ModuleMutator

import lang::rascal::\syntax::Rascal;
import List;
import Set;
import util::Math;
import ParseTree;
import IO;
import String;

bool debugging = true;

//private void debugFun(str s) = println("debug: <s>") when debugging; //BUG

private void debugFun() {
  if (debugging) println();
}

private void debugFun(str s) {
  if (debugging) println("debug: <s>");
}

list[str] mutate(loc input, int mutations = 5, real chance = 0.1, str folder="mutants", str prefix="", set[str] onlyFuncSet={}) {
  m = parse(#start[Module], input).top;
  list[str] modList = [];
  str muModName;
  for (new <- mutate(m, mutations=mutations, chance=chance, prefix=prefix, parentMod=folder,onlyFuncSet=onlyFuncSet)) {
    muModName = "<getModuleName(new)>.rsc";
    writeFile(input.parent + folder + muModName, "<new>");
    modList += muModName;
  }
  return modList;
}

list[Module] mutate(Module input, int mutations = 5, real chance = 0.1, str prefix="", str parentMod="", set[str] onlyFuncSet={}) {
  list[Module] ret = [];
  
  for(opId <- muOpers) {
    ret = ret + make(input, opId, chance=chance, prefix=prefix, parentMod=parentMod, onlyFuncSet=onlyFuncSet);
    if (size(ret) >= mutations) break;
  }
  return ret;
}

private set[str] muOpers = {
 //"ABS",
 "COR1","COR2","COR3","COR4","COR5","COR6",
 "BSR1","BSR2","BSR3","BSR4","BSR5",
 "PWA","PWAR"
};

tuple[bool,PatternWithAction] muOperPattAction("PWA", (PatternWithAction) `<Pattern p> : <Statement _>`) = <true,
(PatternWithAction) `<Pattern p> : throw "mutant! PWA: Remove action from pattern and action.";`>
when !(p is concrete);

tuple[bool,PatternWithAction] muOperPattAction("PWAR", (PatternWithAction) `<Pattern p> =\> <Replacement _>`) = <true,
(PatternWithAction) `<Pattern p> : throw "mutant! PWAR: Remove pattern rewrite.";`>
when !(p is concrete);

default tuple[bool,PatternWithAction] muOperPattAction(str opId, PatternWithAction pa) = <false,pa>;

tuple[bool,Statement] muOperStm("BSR1", (Statement) `if (<{Expression ","}+ cond>) <Statement s>`) = <true,
(Statement) `if (<{Expression ","}+ cond>) 
            '  throw "mutant! BSR1: Remove if conditionals. Case 1.";`>
when !(cond is concrete);

tuple[bool,Statement] muOperStm("BSR2", (Statement) `if (<{Expression ","}+ cond>) <Statement s> else <Statement t>`) = <true,
(Statement) `if (<{Expression ","}+ cond>) throw "mutant! BSR2: Remove if conditionals. Case 2."; else <Statement t>` >
when !(cond is concrete);

tuple[bool,Statement] muOperStm("BSR3", (Statement) `if (<{Expression ","}+ cond>) <Statement s> else <Statement t>`) = <true,
(Statement) `if (<{Expression ","}+ cond>) <Statement s> else throw "mutant! BSR3: Remove if conditionals. Case 3.";` >
when !(cond is concrete);

tuple[bool,Statement] muOperStm("BSR4", (Statement) `while (<{Expression ","}+ cond>) <Statement s>`) = <true,
(Statement) `while (<{Expression ","}+ cond>) throw "mutant! BSR4: Remove while conditionals.";` >
when !(cond is concrete);

tuple[bool,Statement] muOperStm("BSR5", (Statement) `for (<{Expression ","}+ cond>) <Statement s>`) = <true,
(Statement) `for (<{Expression ","}+ cond>) throw "mutant! BSR5: Remove for conditionals.";` >
when !(cond is concrete);

/*
tuple[bool,Statement] muOperStm("ABS", Statement stm) {
  if (!(stm is variableDeclaration)) return <false, stm>;
  
  list[str] lst = ["Name:<n>, Exp:<e>;" | /initialized(n,e) := stm];
  if (isEmpty(lst)) {
    lst = ["Name:<n>" | /unInitialized(n) := stm];
  }
  
  debugFun();
  for (s <- lst) {
    debugFun(s);
  }
  
  return <false, stm>;
}*/

default tuple[bool,Statement] muOperStm(str opId, Statement stm) = <false,stm>;

tuple[bool,Expression] muOperExp("COR1", (Expression) `<Expression lhs> \>= <Expression rhs>`) = <true,
(Expression) `<Expression lhs> \<= <Expression rhs>`>;

tuple[bool,Expression] muOperExp("COR2", (Expression) `<Expression lhs> \<= <Expression rhs>`) = <true,
(Expression) `<Expression lhs> \>= <Expression rhs>`>;

tuple[bool,Expression] muOperExp("COR3", (Expression) `<Expression lhs> \< <Expression rhs>`) = <true,
(Expression) `<Expression lhs> \> <Expression rhs>`>;

tuple[bool,Expression] muOperExp("COR4", (Expression) `<Expression lhs> \> <Expression rhs>`) = <true,
(Expression) `<Expression lhs> \< <Expression rhs>`>;

tuple[bool,Expression] muOperExp("COR5", (Expression) `<Expression lhs> == <Expression rhs>`) = <true,
(Expression) `<Expression lhs> != <Expression rhs>`>;

tuple[bool,Expression] muOperExp("COR6", (Expression) `<Expression lhs> != <Expression rhs>`) = <true,
(Expression) `<Expression lhs> == <Expression rhs>`>;
        
default tuple[bool,Expression] muOperExp(str opId, Expression e) = <false,e>;

list[Module] mutationOp(str opId, Module input, set[str] onlyFuncSet) {
  if (opId notin muOpers) throw "mutationOp: Invalid mutation operator <opId>!";
  
  println("mutationOp: <opId>, <input.header.name>, <onlyFuncSet>");
  /*
  println("mutationOp: <opId>, <onlyFuncSet>");
  println(input);
  println();
  */
  
  list[Module] lMMod = [];
  
  bool runOp = false;
  bool rFunc = !isEmpty(onlyFuncSet);
  
  int curMuOperPoint;
  int curMuOper = 1;
  int fCount = 0;
  //Speed up var declarations
  str s1;
  
  while (!runOp) {
    runOp = true;
    curMuOperPoint = 0;
  
    m = top-down visit(input) {
      case FunctionDeclaration d : {
        s1 = "<d.signature.name>";
        
        //Ignore these situations
        if ( (d is abstract) ||
             (\test() <- d.signature.modifiers.modifiers) ) {
          //println("mutationOp: <opId>, Igonore function <s1>");
          insert d;
        } else if ( rFunc && "<s1>" notin onlyFuncSet ) {
          //println("mutationOp: <opId>, Igonore function <s1> because it is not in <onlyFuncSet>");
          insert d;
        } else {
          //println("<runOp>, <s1>, <onlyFuncSet>, <ln>");
          //println("OK. Look the mu points in <s1>");
          
          FunctionDeclaration fdRet;
          fdRet = top-down visit(d) {
            case PatternWithAction pa: {
              if (runOp) {
                //println("PatternWithAction:1 <opId>, <pa>, <curMuOper>");
                tuple[bool r,PatternWithAction s] ret = muOperPattAction(opId, pa);
                //println("ret result: <ret.r>");
                if (ret.r) {
                  curMuOperPoint += 1;
                  if (curMuOper == curMuOperPoint) {
                    debugFun("PatternWithAction:2 <s1>, <opId>, <pa.pattern>");
                    runOp = false;
                    insert ret.s;
                  }
                }
              }
            }
            
            case Statement stm: {
              //println("Statement:1 <opId>, <stm>, <curMuOper>");
              if (!(stm is \visit) && runOp) {
                tuple[bool r, Statement s] ret = muOperStm(opId, stm);
                //println("ret result: <ret.r>");
                if (ret.r) {
                  curMuOperPoint += 1;
                 
                  if (curMuOper == curMuOperPoint) {
                    debugFun("Statement:2 <s1>, <opId>, <stm>");
                    runOp = false;
                    insert ret.s;
                  }
                }
              }
            }
           
            case Expression exp: {
              //println("Expression:1 <opId>, <exp>, <curMuOper>");
              if (runOp) {
                tuple[bool r, Expression e] ret = muOperExp(opId, exp);
                //println("ret result: <ret.r>");
                if (ret.r) {
                  curMuOperPoint += 1;
                 
                  if (curMuOper == curMuOperPoint) {
                    debugFun("Expression:2 <s1>, <opId>, <exp>");
                    runOp = false;
                    insert ret.e;
                  }
                }
              }
            }
            
          }
          
          insert fdRet;
          
         }
      }
      
    }
    
    if (!runOp) lMMod += m;
    
    curMuOper += 1;
  }
  
  //println("mutationOpOld: Return size: <size(lMMod)>");
  
  return lMMod;
}

/*
list[Module] mutationOpOLD(str opId, Module input, set[str] onlyFuncSet) {
  if (opId notin muOpers) throw "mutationOp: Invalid mutation operator <opId>!";
  println("mutationOpOld: <opId>, <onlyFuncSet>");
  
  list[Module] lMMod = [];
  
  Module m;
  bool runOp = false;
  int curMuOperPoint;
  int curMuOper = 1;
  
  while (!runOp) {
    runOp = true;
    curMuOperPoint = 0;
    
    m = top-down visit(input) {
      
      // do not mutate inside test definitions:
       case FunctionDeclaration d => d
         when runOp && \test() <- d.signature.modifiers.modifiers

       case PatternWithAction pa: {
         if (runOp) {
           //debugFun("PatternWithAction: <opId>");
           tuple[bool r,PatternWithAction s] ret = muOperPattAction(opId, pa);
           if (ret.r) {
             curMuOperPoint += 1;
             if (curMuOper == curMuOperPoint) {
               debugFun("muOperPattAction: <opId>, <pa.pattern>");
               runOp = false;
               insert ret.s;
             }
           }
         }
       }
       
       case Statement stm: {
         if (!(stm is \visit) && runOp) {
           tuple[bool r, Statement s] ret = muOperStm(opId, stm);
           if (ret.r) {
             curMuOperPoint += 1;
             
             if (curMuOper == curMuOperPoint) {
               debugFun("Statement: <opId>, <stm>");
               runOp = false;
               insert ret.s;
             }
           }
         }
       }
       
       case Expression exp: {
         if (runOp) {
           tuple[bool r, Expression e] ret = muOperExp(opId, exp);
           if (ret.r) {
             curMuOperPoint += 1;
             
             if (curMuOper == curMuOperPoint) {
               debugFun("Expression: <opId>, <exp>");
               runOp = false;
               insert ret.e;
             }
           }
         }
       }
       
    };
    
    if (!runOp) lMMod += m;
    
    curMuOper += 1;
  }
  
  return lMMod;
}
*/  

list[Module] make(Module input, str opId, real chance = 0.1, str prefix="", str parentMod="", set[str] onlyFuncSet={}) {
  list[Module] lMMod = [];
  
  lMMod = mutationOp(opId, input, onlyFuncSet);
  
  if (size(lMMod) == 0) return [];
  
  lMMod = [rename("<opId>_<mIdx>", prefix, parentMod, lMMod[mIdx]) | mIdx <- [0..size(lMMod)]];
  return lMMod;
}
 
Module rename(str c, str prefix, "", (Module) `<Tags t> module <{Name "::"}+ p> :: <Name last> <Import* i> <Body b>`) =
(Module) `<Tags t> 
            'module <{Name "::"}+ p>::<Name newName>
            '
            '<Import* i>
            '
            '<Body b>`
   when Name newName := [Name] "<prefix><last><c>";
   
Module rename(str c, str prefix, str parentMod, (Module) `<Tags t> module <{Name "::"}+ p> :: <Name last> <Import* i> <Body b>`) =
   (Module) `<Tags t> 
            'module <{Name "::"}+ p>::<Name f>::<Name newName> 
            '
            '<Import* i>
            '
            '<Body b>`
   when Name newName := [Name] "<prefix><last><c>" && Name f := [Name] "<parentMod>";

Module rename(str c, str prefix, "", (Module) `<Tags t> module <Name last> <Import* i> <Body b>`) = 
   (Module) `<Tags t> 
            'module <Name newName>
            '
            '<Import* i>
            '
            '<Body b>`
   when Name newName := [Name] "<prefix><last><c>";

Module rename(str c, str prefix, str parentMod, (Module) `<Tags t> module <Name last> <Import* i> <Body b>`) = 
   (Module) `<Tags t>
            'module <Name f>::<Name newName>
            '
            '<Import* i>
            '
            '<Body b>`
   when Name newName := [Name] "<prefix><last><c>" && Name f := [Name] "<parentMod>";
   
default str rename(Module x) { throw "can not rename name of <x.header>"; } 
  
str getModuleName((Module) `<Tags _> module <{Name "::"}+ _> :: <Name last> <Import* _> <Body _>`) = "<last>";
str getModuleName((Module) `<Tags _> module <Name last> <Import* _> <Body _>`) = "<last>"; 
default str getModuleName(Module x) { throw "can not find name of <x.header>"; }

//TestSet Block

test bool renameTest1() = rename("20", "", "", (Module) `module a::b::X`) == (Module) `module a::b::X20`;
test bool renameTest2() = rename("20", "", "", (Module) `module X`) == (Module) `module X20`;

test bool renameTest3() = rename("20", "", "mutants", (Module) `module a::b::X`) == (Module) `module a::b::mutants::X20`;
test bool renameTest4() = rename("20", "", "mutants", (Module) `module X`) == (Module) `module mutants::X20`;

test bool mutationPWATest1() = size(make(
(Module) `module PWA1
'import IO;
'public bool f1(int i){
'  visit (i) {
'    case 3 : return true;
'    case 4 : return false;
'  }
'}`, "PWA")) == 2;

test bool mutationPWATest2() = isEmpty(make(
(Module) `module PWA1
'import IO;
'public bool f1(int i){
'  return false;
'}`, "PWA"));

test bool mutationBSRTest1() = isEmpty(make(
(Module) `module BSR
'import IO;
'public bool f1(int i){
'  return false;
'}`, "BSR1"));

/*
test bool mutationABSTest1() = isEmpty(make(
(Module) `module ABS
'import IO;
'public bool f1(int i){
'  int a = 3;
'  int b,c;
'  a = a + 2;
'  return a == 0;
'}`, "ABS"));
*/

test bool mutationCORTest1() = size(make(
(Module) `module COR
'import IO;
'public bool f1(int i){
'  return i \>= 2;
'}`, "COR1")) == 1;

test bool mutationCORTest2() = size(make(
(Module) `module COR
'import IO;
'public bool f1(int i){
'  return i \<= 2;
'}`, "COR2")) == 1;

test bool mutationCORTest3() = size(make(
(Module) `module COR
'import IO;
'public bool f1(int i){
'  return i \< 2;
'}`, "COR3")) == 1;

test bool mutationCORTest4() = size(make(
(Module) `module COR
'import IO;
'public bool f1(int i){
'  return i \> 2;
'}`, "COR4")) == 1;

test bool mutationCORTest5() = size(make(
(Module) `module COR
'import IO;
'public bool f1(int i){
'  return i == 2;
'}`, "COR5")) == 1;

test bool mutationCORTest6() { 
println("\n--\> mutationCORTest6\n");
return size(make(
(Module) `module COR
'import IO;
'public bool f1(int i){
'  return i != 2;
'}`, "COR6")) == 1;
}

test bool mutationCORTest7() {
println("\n--\> mutationCORTest7\n");
list[Module] lm = make(
(Module) `module COR
'import IO;
'public bool f1(int i){
'  return i != 2;
'}`, "COR6", chance=0.1, prefix="", parentMod="", onlyFuncSet={"f2"});
//println(size(lm));
//println(lm[0]);
return size(lm) == 0;
}

test bool mutationCORTest8() {
println("\n--\> mutationCORTest8\n");
list[Module] lm = make(
(Module) `module COR
'import IO;
'public bool f2(int i){
'  return i != 2;
'}`, "COR6", chance=0.1, prefix="", parentMod="", onlyFuncSet={"f2"});
//println(size(lm));
//println(lm[0]);
return size(lm) == 1;
}

test bool mutationCORTest9() {
println("\n--\> mutationCORTest9\n");
list[Module] lm = make(
(Module) `module CORT
'import IO;
'test bool t1(int i){
'  return i != 2;
'}
'
'public bool f1(int i){
'  return i != 2;
'}`, "COR6");
//println(size(lm));
//println(lm[0]);
return size(lm) == 1;
}