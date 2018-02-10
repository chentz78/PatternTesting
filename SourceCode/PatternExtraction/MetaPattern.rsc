@bootstrapParser
module MetaPattern

import IO;
import String;

import lang::rascal::\syntax::Rascal;
import ParseTree;

alias compPattern = tuple[bool(value) patt, Pattern pattAST];

public compPattern compilePattern(str patt) = compilePattern(patt, "");

private compPattern compilePattern(str patt, str pattGuard) {
  try {
    Pattern p = parse(#Pattern, patt);
    
    //Template for pattern closure 
    str lCmds = "bool(value sub) {
    '  if (<patt> := sub 
    ' <if (!isEmpty(pattGuard)) {>
    ' && <pattGuard>
    '  <}> ) {
    '    return true;
    '  } else {
    '    return false;
    '  }
    '};";
    
    //println("compilePattern verbose debug: <lCmds>");
    //r = eval(#bool(value sub), lCmds); //Bug Rascal
    r = eval(lCmds);
    if (result(v) := r) {
      return <v, p>;
    } else {
      throw "compilePattern: Execution error for the pattern: <patt>.";
    }
  } catch ParseError(loc l): {
    throw "compilePattern: Invalid pattern: \"<patt>\", error found at column <l.begin.column>";
  }
}

