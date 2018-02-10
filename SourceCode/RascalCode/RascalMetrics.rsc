@bootstrapParser
module RascalMetrics

import ParseTree;
import lang::rascal::\syntax::Rascal;
import IO;
import Set;

int cntAlt(Prod p){
    switch(p){
      case (Prod) `<Prod lhs> | <Prod rhs>`: return cntAlt(lhs) + cntAlt(rhs);
      case (Prod) `<Prod lhs> \> <Prod rhs>`: return cntAlt(lhs) + cntAlt(rhs);
    }
   return 1;
}

void main() { 
  loc moduleLoc;
  //moduleLoc = |std:///lang/rascal/syntax/Rascal.rsc|;
  moduleLoc = |std:///demo/lang/Pico/Syntax.rsc|;
  //moduleLoc = |std:///lang/java/syntax/Java15.rsc|;
  
  ret = measure(moduleLoc);
  print("Prod: ");
  println(ret["productions"]);
  print("NT: ");
  println(ret["nonterminal"]);
  print("Terms: ");
  println(ret["terminal"]);
}

map[str,int] measure(loc ml){
    
    m = parse(#start[Module], ml).top;
    stats = ();
    nonterm = {};
    terms = {};
    
    visit(m){
      case (SyntaxDefinition) `<Visibility _> layout <Sym name> = <Prod p> ;`: {
        stats["layout"] ? 0 += 1;
        nonterm += "<name>";
        stats["layoutAlts"] ? 0 += cntAlt(p);
      }
      case (SyntaxDefinition) `lexical <Sym name> = <Prod p> ;` : {
        stats["lexical"] ? 0 += 1;
        nonterm += "<name>";
        stats["lexicalAlts"] ? 0 += cntAlt(p);
      }
      case (SyntaxDefinition) `keyword <Sym name> = <Prod p> ;` : {
        stats["keyword"] ? 0 += 1;
        nonterm += "<name>";
        stats["keywordAlts"] ? 0 += cntAlt(p);
      }
      case (SyntaxDefinition) `<Start _> syntax <Sym name> = <Prod p> ;` : {
        nonterm += "<name>";
        stats["syntax"] ? 0 += 1;
        stats["syntaxAlts"] ? 0 += cntAlt(p);
      }
      case literal(s): terms += "<s>";
    }
    stats["nonterminal"] = size(nonterm);
    stats["terminal"] = size(terms);
    //println("NT: <nonterm>");
    //println("T: <terms>");
    int p = 0;
    for ( s <- ["layoutAlts","lexicalAlts","keywordAlts","syntaxAlts"] ) {
      //println(s);
      p += (s in stats ? stats[s] : 0);
    }
    
    stats["productions"] = p;
    return stats;
}