module MuPico

import lang::rascal::mutation::ModuleMutator;

public void main() {
  mutate(|project://PicoMetric/src/main.rsc|, mutations=3);
}