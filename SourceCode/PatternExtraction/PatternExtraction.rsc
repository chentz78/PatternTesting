@bootstrapParser
module PatternExtraction

import util::Reflective;
import lang::rascal::\syntax::Rascal; 
import ParseTree;
import IO;
import Map;
import Set;

import MetaPattern;

anno loc node@location;

list[node] getPrefixPatterns(loc m) = 
  [ implode(#node, p) | p <- extractPatterns(m) ]; 

set[str] filterTypedVars(set[node] i) = 
  { name | /"typedVariable"(_,name) <- i }; 

set[node] filterCallOrTree(set[node] i) = 
  { p | p:"callOrTree"(_,_,_) <- i };

private tuple[int total,int filtered, list[str] patts] countPattTree(Tree t, set[str] lblSet) {
  tuple[int total,int filtered, list[str] patts] ret = <0,0,[]>;
  //println("countPattTree: begin <lblSet>");
  list[str] lst = [];
  top-down-break visit (t) {
    case Pattern p : {
      if (!isEmpty(lblSet) && appl(prod(/label(l,_),_,_),_) := p && l in lblSet) {
        //println("countPattTree: Patt <p>");
        ret.filtered += 1;
        lst += "<p>";
      } else if ( isEmpty(lblSet) ) lst += "<p>";
      ret.total += 1;
    }
  }
  ret.patts = lst;
  return ret; 
}

list[Pattern] extractPatterns(loc lm) { 
  if (Module m := parseModule(lm)) { 
    return [ p | /Pattern p := m]; 
  }

  throw "could not parse module <lm>"; 
}

public map[str, list[Tree]] getPatternTree(loc lt) {
  Tree m = parseModule(lt);
  return getPatternTree(m);
}

private list[Pattern] extractPattTree(Tree t, set[str] lblSet) {
  list[Pattern] ret = [];
  top-down-break visit (t) {
    case Pattern p : {
      if (isEmpty(lblSet) || 
          ( appl(prod(/label(l,_),_,_),_) := p && l in lblSet ) ) {
        ret += p;
      }
    }
  }
  return ret; 
}

alias aGPRet = map[str , tuple[str fSig, list[Tree] patts]];

public aGPRet getPatternTree(Tree t, set[str] lblFSet) {
  aGPRet r = ();
  
  str nm,sig;
  
  for (/FunctionDeclaration f := t) {
    Tree st;
    if (f has signature) {
      nm = "<f.signature.name>";
      sig = "<f.signature>";
    }
    
    try {
      if (f has expression) {
        st = f.expression;
      }
      
      if (f has body) {
        st = f.body;
      }
      
      if (nm in r) {
        r[nm].patts += extractPattTree(st,lblFSet);
      } else {
        r += (nm:<sig, extractPattTree(st,lblFSet)>);
      }
    } catch e : println("getPatternTree exception: <e>");
  }
  
  return r;
}

public set[str] defLblFilter = {"callOrTree","concrete","descendant"};

public aGPRet getPatternTree(Tree t) = getPatternTree(t,defLblFilter);

public map[str, int] getPatternStats(loc lt) {
  Tree m = parseModule(lt);
  return getPatternStats(m);
}

public map[str, int] getPatternStats(Tree t, bool quiet, set[str] lblFSet = {"callOrTree","concrete","descendant"}) {
  //str nm;
  map[str, int] r = ();
  int fNum = 0;
  int TotNum = 0;
  tuple[int,int] ret;
  
  int fCount = 0;
  int fPatt = 0;
  int fWOPatt = 0;
  str fName;
  set[str] pSet = {};
  
  for (/FunctionDeclaration f := t) {
    Tree st;
    fCount+=1;
    if (!quiet) {
      println("<f.signature.name>(<f@\loc.begin.line>,<f@\loc.end.line>) LOC: <(f@\loc.end.line - f@\loc.begin.line)+1>");
    }
    /*
    if (f has signature) {
      fName = "<f.signature.name>";
    }
    */
    
    try {
      if (f has expression) {
        st = f.expression;
      }
      
      if (f has body) {
        st = f.body;
      }
      
      ret = countPattTree(st,lblFSet);
      
      fNum += ret.filtered;
      TotNum += ret.total;
      pSet += toSet(ret.patts);
      
      //Get info about functions
      if (ret.total >0) {
        fPatt+=1;
      } else {
        fWOPatt+=1;
      }
    //println("<nm>::<ret.filtered>");
      
    } catch e : println("getPatternStats exception: <e>");
  }
  
  //println("getPatternStats: <fNum>, <TotNum>");
  assert fNum<=TotNum : "getPatternStats: Filtred pattern is grater than total patterns.";
  
  return ("filtered":fNum,
          "unfiltered":TotNum-fNum,
          "uniquePatts":size(pSet),
          "total":TotNum,
          "func": fCount,
          "funcPatt": fPatt,
          "funcWOPatt": fWOPatt);
}

private loc sMSample = |cwd:///MSample.rsc|;
private loc sMcCabeM3 = |cwd:///McCabeM3.rsc|;

void main() {
  println("Checking the files...");
  if (!(exists(sMSample) && isFile(sMSample))) {
    throw "Invalid File!";
  }
  
  Tree m = parseModule(sMSample);
  map[str,int] stats = getPatternStats(m);
  println("Stats from sMSample");
  for (e <- stats) {
    println("<e>: <stats[e]>");
  }
  
  
  list[Pattern] l1 = extractPatterns(sMSample);
  println("List Patt from sMSample - <size(l1)>");
  int i = 1;
  for (e <- l1) {
    println("Patt Index: <i>, \'<e>\'");
    i = i + 1;
  }
  
  println("List Patt from sMcCabeM3");
  
  m = parseModule(sMcCabeM3);
  stats = getPatternStats(m);
  println("Stats from sMcCabeM3");
  for (e <- stats) {
    println("<e>: <stats[e]>");
  }
  
  println("Test tree--Initial Tree");
  //rprintln(m);
  map[str, list[Tree]] patts = getPatternTree(sMcCabeM3);
  println("getPatternTree::Result");
  for (e <- patts) {
    print("<e>::");
    println(["<p>" | p <- patts[e]]);
    //implode(#node, p) | p <- extractPatterns(m)
  }
}

test bool tstBasic1() = size(extractPatterns(sMSample)) == 1;
test bool tstBasic2() = size(extractPatterns(sMcCabeM3)) > 0;
test bool tstBasic3() = size(getPatternTree(sMSample)) == 1;
test bool tstBasic4() = size(getPatternTree(sMcCabeM3)) > 0;
test bool tstBasic5() = size(getPatternStats(sMcCabeM3)) == 3;
test bool tstBasic6() = getPatternStats(sMcCabeM3)["total"] == 13;