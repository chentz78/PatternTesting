@bootstrapParser
module parseCheckTypes

import IO;
import Map;
import Set;
import Relation;
import String;

import util::Benchmark;
import util::Reflective;

import lang::rascal::\syntax::Rascal; 
import lang::rascal::\types::CheckTypes;
import ParseTree;

import PatternExtraction;

//Out Sep
private str sep = "%";

//Base Dir
private loc bDir =  |home:///L/rascal-build/usedOnThesis.rascal/src/org/rascalmpl/library/lang/rascal/|;

//Rascal Typechecker
private loc sCheckTypes = bDir + "/types/CheckTypes.rsc";

//Rascal Grammar
private loc lRG = bDir + "/syntax/Rascal.rsc";
private Module RG = parseModule(lRG);

//Java CC
//private loc sCheckTypes = |home:///L/testgeneration-cwi.git/rascal.workfolder/JavaMetric/src/JDTCC.rsc|;

//Pico CC
//private loc sCheckTypes = |home:///L/testgeneration-cwi.git/rascal.workfolder/PicoMetric/src/mainCC.rsc|;

Tree getModule() {
  //println("Parsing ...");
  //Module m = parseModule(|std://lang::rascal::types::CheckTypes|);
  //Module m = parseModule(|home:///L/rascal-build/rascal/src/org/rascalmpl/library/lang/rascal/types/CheckTypes.rsc|);
  //println("Parse OK");
  
  ct = getMilliTime();
  println("Starting the meta-program analysis...");
  println("Module: <sCheckTypes>");
  println("Module Info: <md5HashFile(sCheckTypes)> , <lastModified(sCheckTypes)>");
  t = parseModule(sCheckTypes);
  println("Compile time: <getMilliTime()-ct>");
  return t;
}

alias aGPRet = map[str, tuple[str fSig, list[Tree] patts]];

aGPRet getPattRTC(str id) = getPattRTC(id, defLblFilter);

aGPRet getPattRTC(str id, set[str] lblFilter) {
  Tree m = getModule();
  
  ct = getMilliTime();
  println("<id>:Extracting the pattern set...");
  aGPRet patts = getPatternTree(m, lblFilter);
  println("<id>:Extraction done!");
  println("<id>:Extraction time: <getMilliTime()-ct>");
  return patts;
}

//Return the list of patterns
alias MapPatterns = map[str, tuple[Tree patt, str FName, str FSig, str PattKind] ];

MapPatterns getPattMap(aGPRet patts, bool unique) {
  MapPatterns ret = ();
  set[str] uPatt = {};
  
  kFunc = sort(domain(patts));
  int pCount = 1;
  str sPatt;
  for (fName <- kFunc) {
    pRec = patts[fName];
    if ( size(pRec.patts) > 0 ) {
      for ( pt <- pRec.patts ) {
        sPatt = "<pt>";
        if ( ( unique ? sPatt notin uPatt : true) &&
             appl(prod(/label(pLabel,_),_,_),_) := pt ) {
          ret += ("p<pCount>":<pt, fName, pRec.fSig, "<pLabel>">);
          pCount += 1;
          uPatt += sPatt;
        }
      }
    }
  }
  return ret;
}

private str strCleanUp(str s) {
  ret = escape(s, ("\\":""));
  return ret;
}

set[str] getSymbolsGram() = getSymbolsGram(RG);

set[str] getSymbolsGram(Module m) {
  set[str] sSet = {};
  visit (m) {
    case SyntaxDefinition sd : if ( sd has defined ) {
      sSet += strCleanUp("<sd.defined>");
      for (/labeled(_,lbl,_) := sd) {
        str s = strCleanUp("<lbl>");
        sSet += s;
        //println("Labeled! <s>");
      }
    }
    /*
    case \lexical(s, prod) : sSet += "<s>";
    case language(s, prod) : sSet += "<s>";
    */
  }
  //println(sSet);
  //println(size(sSet));
  return sSet;
}


private set[str] GramSym = getSymbolsGram();
private set[str] findGramMemo = {};

bool findGram(str Sym) {
  if ( Sym in findGramMemo) return true;
  if ( Sym in GramSym) {
    findGramMemo += Sym;
    return true;
  }
    
  return false;
}

str concreteDiscovery(Concrete c) {
 if ( /Sym s := c) return strCleanUp("<s>");
 else throw "discoveryGNT: Non typed pattern!";
}

str discoveryGNT(Pattern p) {
  //println("<p>");
  //println(p);
  //rprintln(p);
  switch (p) {
    case concrete(c) : return concreteDiscovery(c);
    case callOrTree(e, _, _) : return strCleanUp("<e>");
    case descendant(p2) : return discoveryGNT(p2);
    case variableBecomes(_, p2) : return discoveryGNT(p2);
    case typedVariable(tp, _) : return strCleanUp("<tp>");
  }
  return "!error";
}

//Extract the NT and terminal set from a pattern
private tuple[set[str], set[str]] getPattsSet(p) {
  set[str] NTS = {};
  set[str] TS = {};
  
  visit (p) {
    case QualifiedName qn : {
      //println("QualifiedName");
      NTS += "<qn>";
    }
    case hole(h) : {
      //println("ConcreteHole");
      NTS += {"<e>" | /Nonterminal e := h.symbol};
    }
    case text(t) : {
      str ret = "<t>";
      if (size(ret) > 1) ret = trim(ret);
      TS += ret;
    }
    case Literal l : TS += "<l>";
  }
  return <NTS, TS>;
}

//Extract patterns with some information
map[str, tuple[set[str], str, Tree, set[str]]] mExtractPattStructure() {
  aGPRet patts = getPattRTC("mExtractPattStructure");
  pMap = getPattMap(patts, true);

  map[str, tuple[set[str] funcsN, str kind, Tree tree, str NT, set[str] flags]] rPattList = ();
  str sPatt;
  for (pID <- pMap) {
    pRec = pMap[pID];
    sPatt = pID;
    if ( sPatt in rPattList ) {
       rSet = rPattList[sPatt].funcsN;
       rSet += "<pRec.FName>";
       rPattList[sPatt].funcsN = rSet;
    } else {
       NT = discoveryGNT(pRec.patt);
          
       fs = {};
       if (findGram(NT)) fs += "external";
       
       rPattList += ( sPatt : <{"<pRec.FName>"}, "<pRec.PattKind>", pRec.patt, NT, fs> );
    }
  }
    
  //lst = sort(domain(rPattList));
  //map[str, str] lst = ( k : p | p <- rPattList, k := rPattList[p].kind);
  rel[str, str] r1 = {};
  r1 = ( r1 | ( e in it ) ? it : it + <e,rPattList[e].kind>  | e <- rPattList);
  r1 = invert(r1);
  int c;
  int tot = 0;
  
  tuple[ set[str], set[str]] pattSets;
  
  mR1 = index(r1);
  for ( k <- mR1 ) {
    s = sort(toList(mR1[k]));
    println("Listing the kind <k>");
    c = 0;
    for (p <- s) {
      tp = rPattList[p];
      assert(tp.kind == k);
      
      if ( "external" in tp.flags) pattSets = getPattsSet(tp.tree);
      else pattSets = <{},{}>;
      
      println("<k><sep><tp.funcsN><sep><tp.NT><sep><pattSets[0]><sep><pattSets[1]><sep><tp.flags><sep><p>");
      c += 1;
    }
    println("Count:<k>, <c>"); 
    tot += c;
  }
  println("Count total: <tot>");
  //return rPattList;
  return ();
}

//Extract patterns with a lot of information
void mExtractVerbose() {
  aGPRet patts = getPattRTC("mExtractVerbose");
  
  int pCount = 0;
  int ps;
  str lPatt;
    
  //Sort by func name
  list[str] kLst = sort(domain(patts));
  map[str, tuple[str pType, list[tuple[str pFunc,int pLine]] pList]] rPSet = ();
  for (fName <- kLst) {
    lst = patts[fName].patts;
    ps = size(lst);
    pCount += ps;
    if (ps > 0) {
      lPatt = "";
      set[str] pSet = {};
      for ( p <- lst ) {
        str patt = "<p>";
        pSet += patt;
        
        if ( lPatt == "") lPatt = "\"<patt>\""; else lPatt = "<lPatt>,\"<patt>\"";
        
        //Get the line number and type for the pattern
        if (appl(prod(/label(pLabel,_),_,_),_) := p) {
          line = p@\loc.begin.line;
          if (patt in rPSet) {
            lstTmp = rPSet[patt].pList; 
            lstTmp += <"<fName>", line>;
            rPSet[patt].pList = lstTmp; 
          } else {
            rPSet += (patt : <"<pLabel>", [<"<fName>", line>]>);
          }
        }
      }
      
      print("<fName>::");
      print("<size(patts[fName].patts)>(<size(pSet)>)::");
      //println("[<lPatt>]");
      println("<pSet>");
      //println(["<p> : <l> : <p@\loc.begin.line>" | p <- patts[fName], appl(prod(/label(l,_),_,_),_) := p]);
    }
  }
  println("Total Pattern Count: <pCount>");
  
  kLst = sort(domain(rPSet));
  for (e <- kLst) {
    tp = rPSet[e];
    //println(size(tp.pList));
    println("\"<e>\", <tp.pType>, <tp.pList>");
  }
  //mPrintSumary(m);
  println("Total Filtered Patterns : <size(rPSet)>");
}

void mPrintSumary(Tree m) {
  ct = getMilliTime(); 
  println("Getting pattern stats...");
  map[str,int] stats = getPatternStats(m, true);
  println("Function Info: Total: <stats["func"]>, With Patterns: <stats["funcPatt"]> and Without: <stats["funcWOPatt"]>");
  println("Total Patterns: <stats["total"]>, Filtered: <stats["filtered"]>, Unique: <stats["uniquePatts"]> and Unfiltered: <stats["unfiltered"]>");
  println("Stats time: <getMilliTime()-ct>");
}

void mFuncList(bool zeroF) {
  aGPRet patts = getPattRTC("mFuncList");
  int pCount = 0;
  int ps;
    
  //Sort by func name
  list[str] kLst = sort(domain(patts));
  for (fName <- kLst) {
    lst = patts[fName].patts;
    ps = size(lst);
    pCount += ps;
    if (ps > 0) {
      set[str] pSet = {};
      for ( p <- lst ) {
        str patt = "<p>";
        pSet += patt;
      }
      println("<fName>,<ps>,<size(pSet)>");
    } else { 
      if (zeroF) { println("<fName>,0,0"); }
    }
  }
}

void allPatterns() {
  set[str] empS = {};
  aGPRet patts = getPattRTC("allPatterns",empS);
  
  sKeys = sort(domain(patts));
  for ( k <- sKeys) {
    pattTreeList = patts[k].patts;
    for ( pt <- pattTreeList ) {
      str sPatt = "<pt>";
      int l = pt@\loc.begin.line;
      if (appl(prod(/label(pLabel,_),_,_),_) := pt) {
        println("<pLabel><sep><k><sep><l><sep>\"<sPatt>\"");
        
      }
    }
  }
}

void uniquePattList() {
  aGPRet patts = getPattRTC("mExtractPattStructure");
  pMap = getPattMap(patts, true);
  
  for ( k <- sort(domain(pMap))) {
    pRec = pMap[k];
    println("<k><sep><pRec.FSig><sep><pRec.patt>");
  }
  println("Unique pattern count: <size(pMap)>");
}

//Extract concrete and external patterns with function info
void mExtPattConcExt() {
  aGPRet patts = getPattRTC("mExtPattConcExt",{"concrete"});
  
  pMap = getPattMap(patts, false);
  str sPatt;
  for (pID <- pMap) {
    pRec = pMap[pID];
    sPatt = pID;
    
    NT = discoveryGNT(pRec.patt);
    if (findGram(NT)) {
       int ln = pRec.patt@\loc.begin.line;
       println("<pRec.FName><sep><sPatt><sep><ln><sep><pRec.patt>");
    }
  }
  println("Pattern count: <size(pMap)>");
}

void mSumary() {
  mPrintSumary(getModule());
}

void main() {
  mExtractVerbose();
  //mPrintSumary(getModule());
}

void extract() {
  mExtractVerbose();
}

//'getPatternTree(|home:///L/rascal-build/rascal/src/org/rascalmpl/library/lang/rascal/types/CheckTypes.rsc|)'