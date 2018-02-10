@bootstrapParser
module checkRascalMod

import ParseTree;
import IO;
import lang::rascal::\syntax::Rascal;

//To use the type checker
import Set;
import util::Reflective;
import lang::rascal::types::CheckTypes;


PathConfig testingConfig = pathConfig(srcs=[|test-modules:///|, |std:///|], bin=|home:///c1bin|, libs=[|home:///c1bin|]);

public tuple[bool, str] chkModule(loc mf, bool chkTypes) {
  try {
		pt = parse(#start[Module], mf, allowAmbiguity=false);
		if (pt has top && Module m := pt.top) {
		  /*
		  println("Module <mf.file> parsed!");
		  pt = parse(#start[Module], mf, allowAmbiguity=false);
		  println("Module <mf.file> does not have ambiguities!");
		  */
		  if ( ! chkTypes ) return <true,"">;
		  
		  c = newConfiguration(testingConfig);
		  c = checkModule(m, c);
		  if (size(c.messages) == 0) return <true,"">;
		  
		  return <false,"<c.messages>">;
		} else {
			return <false,"Unexpected parse result for module to check: <pt>">;
		}
	} catch perror : {
		return <false,"Could not parse and prepare config for base module to check: <perror>">;
	}
}

public list[str] checkFolder(loc fl, bool onlyOK=true, bool chkTypes=false) {
  list[str] ret = [];
  listF = fl.ls;
  int mOK, mErr;
  mOK = 0;
  mErr = 0;
  for ( f <- listF ) {
    if (f.extension == "rsc") {
      println("Checking file <f.file> ...");
      cmr = chkModule(f, chkTypes);
      if (cmr[0]) {
        println("Module OK <f.file> ");
        mOK += 1;
        ret += "<f.file>:OK";
      } else {
        println("Check error <f.file>: <cmr[1]> ");
        mErr += 1;
        if (!onlyOK) ret += "<f.file>:ERR:<cmr[1]>";
      }
    }
  }
  println("Modules OK: <mOK>");
  println("Modules Err: <mErr>");
  println("Modules Total: <mOK+mErr>");
  return ret;
}