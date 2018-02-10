#!/bin/bash

source util.sh

source envVar.sh

rr=$BASEDIR/bin/runRascal.sh
rTRunner=$BASEDIR/RascalCode/TestRunner.rsc

ModFName=$1
if [[ ! -f $ModFName || -z "$ModFName" ]]; then
  echo "The file doesn't exist!"
  exit 1
fi

if [ -z "$2" ]; then
  quite=off
else
  quite="$2"
fi

failB=$3

#echo "Starting to run $ModFName and quite option $quite"

dtFmt=`date +'%Y%m%d%H%M%S'`
tmpModName=TR_tmp${dtFmt}
tmpFile=$tmpModName.rsc

#Generate testSet
bDir=`pwd`
ModName=$(basename $ModFName)
ModName=${ModName%.*}

mLoc="|file://$bDir/$ModFName|"
#mLoc="|project://TestMetrics/src/|"
fnTestSet=$ModName
fnTestSet+="_testSet.txt"
#echo $fnTestSet

$sed -e "s@\/\*ModName\*\/@module $tmpModName@g" -e "//d" $rTRunner > $tmpFile

if [ $quite == on ]; then
  $rr $tmpFile "genTestSet($mLoc);" &> /dev/null
else
  $rr $tmpFile "genTestSet($mLoc);"
fi

if [ ! -e $fnTestSet ]; then
  echoerr "Error generating the file $fnTestSet!"
  exit 1
fi

echo " " > $tmpFile
echo "ret=true; " >> $tmpFile
while read p; do
  if [ ! -z $failB ]; then
    echo "if (ret) { " >> $tmpFile
  fi
  echo "try{ " >> $tmpFile
  echo "tcNum += 1; " >> $tmpFile
  echo "ret = $p(); " >> $tmpFile
  echo -e "status[\"$p\"] = \"<ret>\";" >> $tmpFile
  echo "if (ret) tcSucc += 1; " >> $tmpFile
  echo "} catch value e: { ret = false; status[\"$p\"] = \"fail:<e>\"; };" >> $tmpFile
  if [ ! -z $failB ]; then
    echo -e "} else { status[\"$p\"] = \"skipped\"; } " >> $tmpFile
  fi
done <$fnTestSet

#Insert the template on module.
#fReplace=$(cat $tmpFile)

fReplace=`$sed ':a;N;$!ba;s/\n//g' $tmpFile`

$sed -e "s@\/\*ModName\*\/@module $tmpModName@g" -e "s@\/\*ModImport\*\/@import $ModName;@g" -e "s@\/\*TestExec\*\/@$fReplace@g" -e "//d" $rTRunner > $tmpFile
#cat $tmpFile

if [ $quite == off ]; then
  echo
  echo $rr $tmpFile "\"runTestSet($mLoc);\""
  $rr $tmpFile "runTestSet($mLoc);"
else
  $rr $tmpFile "runTestSet($mLoc);" | grep "^TestExec"
fi

rm -rf $tmpFile