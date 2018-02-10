#!/bin/bash

fIn=$1
pNum=$2

grep -v '^[0-9]' $fIn
i=1
while read l; do
  echo -e "$i-\c"
  echo $l | awk -F ',' "function f(n) { if (n > $pNum) return (\"\\\\p\" (n-$pNum)); else return (\"p\" n); }; { print f(\$1) "," f(\$2)}"
  i=$((i+1))
done < <(grep '^[0-9]' $fIn)