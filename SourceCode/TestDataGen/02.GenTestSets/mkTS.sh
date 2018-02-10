#!/bin/bash
#1 -> TR File
#2 -> TS Name
#3 -> SS File
#4 -> Base name or function name

fTR=$1
TSN=$2
SS=$3
BaseN=$4

fTRO=TR_$TSN.ts
fTSO=TS_$TSN.ts
rRSO=$TSN.rsc

cp $fTR TR_$TSN.ts
lua genTestSet.lua $fTRO $SS > $fTSO

touch $rRSO

echo "module $TSN" > $rRSO
echo  >> $rRSO
echo "import TestUtil;" >> $rRSO

echo  >> $rRSO
cat ${BaseN}.pls >> $rRSO
echo  >> $rRSO

rm ${BaseN}.pls

c=1
while read l; do
  tcs=`echo $l | cut -d '@' -f 1`
  tcc=`echo $l | cut -d '@' -f 2`
  tcf=`echo $l | cut -d '@' -f 3`
  echo "//$tcc" >> $rRSO
  echo "test bool tc$c() = $tcf(\"tc$c\",\"$tcs\");" >> $rRSO
  echo >> $rRSO
  c=$((c+1))
done  <$fTSO

echo "TestSet size: $((c-1))"
echo "Done!"