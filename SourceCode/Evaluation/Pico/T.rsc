@bootstrapParser

module T

import lang::rascal::\syntax::Rascal;
import ParseTree;
import IO;

import ModuleMutator;

Module parseRascalMod(loc input) = parse(#start[Module], input).top;

void main() {
  mutate(|file:///Users/chentz/L/testgeneration-cwi.git/rascal.workfolder/PicoMetric/src/main.rsc|);
  print("End of function main.");
}

test bool test1() {
  mutate(|file:///U1sers/chentz/L/testgeneration-cwi.git/rascal.workfolder/PicoMetric/src/main.rsc|);
  return true;
}