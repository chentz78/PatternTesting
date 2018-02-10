#!/bin/bash

rBase=~/L/usedOnThesis.rascal/src/org/rascalmpl
patt="$1"
sp=*

case "$2" in
  r)
    sp=$rBase/
  ;;
  rLibR)
    sp=$rBase/library/lang/rascal/
  ;;
  *)
    sp="$2"
  ;;
esac

grep --color -n -rH -P $patt $sp