#!/bin/bash

rr=runRascal.sh
rcm=checkRascalMod.rsc

RTS=$1
outF=$2

[ -z $outF ] && outF=out

#RMNS=( $(grep -Po 'module N[0-9]+' $RTS | cut -d ' ' -f2) )

while read rp; do
  RMN=`echo $rp | grep -Po 'module N[0-9]+' | cut -d ' ' -f2`
  echo "Generating Rascal module $RMN ..."
  echo $rp > $outF/${RMN}.rsc
done < $RTS

echo "Checking modules..."

bDir=`pwd`

mLoc="|file://$bDir/$outF|"
ctmp=/tmp/chkTmp.out
$rr $rcm "checkFolder($mLoc,onlyOK=true,chkTypes=false);" &> $ctmp
#$rr $rcm "checkFolder($mLoc,onlyOK=true,chkTypes=false);"

echo
echo "Results"
cat $ctmp | grep 'Modules'
echo

echo "Do you want move the error modules to err folder?"
read y
if [[ $y == "y" ]]; then
  mkdir -p chkTmp
  echo "Backaping OK files..."
  while read f; do
    mv $outF/$f chkTmp/
  done < <(cat $ctmp | grep -Po '\[\".*\]' | gsed -e 's@","@\n@g' -e 's@\[\"@@g' | cut -d ':' -f 1)
  mkdir -p $outF/err
  mv $outF/*.rsc $outF/err/
  mv chkTmp/* $outF/
  rm -rf chkTmp/
fi


rm -rf $ctmp