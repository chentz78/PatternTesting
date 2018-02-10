module searchRascal

import IO;
import String;
import Map;

import util::Reflective;
import lang::rascal::\syntax::Rascal; 
import ParseTree;

public map[str, &T] srcCode(loc file, map[str, &T](Module) fCheck) {
  println("srcCodeFile: Parsing...");
  if (!isFile(file)) throw "Invalid file!";
  
  if (Module m := parseModule(file)) {
    println("srcCodeFile: Parsed.");
    return fCheck(m);
  } else throw "Error parsing the file!";
}

public int srcCode(loc folder, bool deepSearch, int maxFound, int(Module) fCheck) {
  //, endsWith(f, ".rsc")
  int idx = 0;
  //println(folder);
  if (isFile(folder)) throw "Invalid folder!";
  for (f <- [f | str f <- listEntries(folder)]) {
    //println("Parsing file <f> ...");
    if (deepSearch && idx <= maxFound && !startsWith(f, ".") && isDirectory(folder + "<f>")) {
      println("Now finding on <f>...");
      idx += srcCode(folder + "<f>", deepSearch, maxFound-idx);
    }
    
    if (isFile(folder + "<f>") && endsWith(f, ".rsc") && start[Module] m := parseModule(folder + "<f>")) {
      //println("File <f> parsed!");
      //println("Starting the search for pattern in <f> ...");
      //if (/Expression e := m && e is reducer) {
      //str nm = "";
      
      idx = fCheck(m);
            
      if (maxFound > 0 && idx >= maxFound) break;
      
    }; // else println("Error parsing file <f>!");
  }
  return idx;
}

public void main() {
  println("Load OK");
}
