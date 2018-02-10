module exCalculatePattType

import IO;
import util::Reflective;
import lang::rascal::\syntax::Rascal;
import lang::rascal::\types::CheckTypes;
import lang::rascal::\types::CheckerConfig;
import ParseTree;

//PathConfig pc = pathConfig(srcs=[|test-modules:///|, |std:///|], bin=|home:///c1bin|, libs=[|home:///c1bin|]);
PathConfig pc = pathConfig(srcs=[|std:///|,|cwd:///|], bin=|cwd:///|, libs=[|cwd:///|]);

void main() {
  Tree t = parseModule(|cwd:///a.rsc|);
  if ( /Expression exp:(Expression)`<Pattern p> := <Expression e>` := t ) {
    println("Pattern:\"<p>\" and subject: \"<e>\"");
    
    c = newConfiguration(pc);
    < rc, s > = checkExp(e, c);
    println(s);
    < rc, tp > = calculatePatternType(p,rc, [s]);
    println("OK");
    rprintln(tp);
  }
}