#!/bin/bash

cDt=`date '+%d/%m/%Y %H:%M'`

pNum=$1
SysName=$2

rpNum=$((pNum/2))

fOut=$SysName.txt

cat > $fOut <<EOF
-- Gen. on $cDt
  
[System]
Name: $SysName
  
[Parameter]
EOF

if [ ! -z $3 ]; then
  echo "Inverted matrix!"
  
  for ((i=1; i <= rpNum; i++))
  do
    echo "p$i (bool) : true,false" >> $fOut
    echo "np$i (bool) : true,false" >> $fOut
  done
  
  echo "[Constraint]" >> $fOut
  for ((i=1; i <= rpNum; i++))
  do
    echo "p$i != np$i" >> $fOut
  done
else
  a="a1 (int) : 1"
  for ((i=2; i <= pNum; i++))
  do
    a+=", $i"
  done
  echo $a >> $fOut
  
  a="a2 (int) : 1"
  for ((i=2; i <= pNum; i++))
  do
    a+=", $i"
  done
  echo $a >> $fOut
  
  cat >> $fOut <<EOF

[Constraint]
a1 != a2
(a1 - 1) < a2
(a2 - a1) != $rpNum
EOF
fi
echo "Done!"