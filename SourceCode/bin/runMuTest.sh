#!/bin/bash

source util.sh

source envVar.sh

if [ -z "$BASEDIR" ]; then
  echo "Invalid BaseDir variable! BASEDIR: $BASEDIR"
  exit 1
fi

rr=$BASEDIR/bin/runRascal.sh

genT=$BASEDIR/bin/genTestSet.sh
runT=$BASEDIR/bin/runTestSet.sh
mr=$BASEDIR/RascalCode/ModuleMutator.rsc

restoreBkp() {
  mv $bkpOrig $bDir/${ModUnderTest}
}
  
dt=`date +'%Y%m%d_%H%M%S'`

MuTConfig=$1
if [ -f "$MuTConfig" ]; then
  echo "Importing $MuTConfig"
  source $MuTConfig
else
  echo "Invalid Mutation config file!"
  echo "File: $MuTConfig"
  exit 1
fi

echo "Mutation config:"
echo "TestSet: $TestSet"
echo "T. S. Prefix: $TSetPrefix"
echo "Module Under Test: $ModUnderTest"
echo "Func. Under Test: $ModFunc"
echo "T. C. File Ext.: $TestCaseExt"
echo "Date: $dt"
echo "Mutation Size Limit: $MuSetSize"
if [ ! -z $useCacheMut ]; then
  echo "Use Mutation cache from : $useCacheMut"
  if [ ! -d $useCacheMut ]; then
    echo "Invalida mutation cache folder!"
    exit 1
  fi
fi

R_MODULE=$ModUnderTest
if [[ $ModUnderTest =~ "I@" ]]; then
  R_MODULE=`echo $ModUnderTest | cut -d'@' -f2`
fi

echo "Running the test set for the first time..."
if [ -e $R_MODULE ]; then
  MN=$(basename $R_MODULE)
  MN=${MN%.*}
else
  MN=${R_MODULE##*::}
fi

rslFN=${TSetPrefix}_TS_${dt}.rsl

echo "Running the module internal tests..."
iErrors=`$rr $TestSet test | grep 'Error'`

if [ ! -z "$iErrors" ]; then 
  echoerr "Internal testing fail!"
  exit 1
fi

#echo "$runT $TestSet > $rslFN"
$runT $TestSet > $rslFN

if [[ $? -gt 0 ]]; then 
  echoerr "Testing fail!"
  exit 1
fi
find . -name 'TR_tmp*' -type f -delete

cat $rslFN
anyF=`grep -P '^TestExec.*\: (fail|false)' $rslFN`

if [ ! -z "$anyF" ]; then
  echo "Invalid initial results!"
  echo $anyF
  exit 1
fi

echo "Test set OK! Start the mutation process..."
bDir=$PWD

if [ -z "$MuSetSize" ]; then
  MuSetSize=3
fi

lr="|file://$bDir/$ModUnderTest|"
fMuRsl=${TSetPrefix}_MUTMP_${dt}.log

echo "Module Loc: $lr"
echo "Mutation set size: $MuSetSize"
echo "Mutation process log: $fMuRsl"
#$rr $mr "mutate($lr, mutations=$MuSetSize,folder=\"\",prefix=\"${TSetPrefix}_MU_\")"

if [ -z $useCacheMut ]; then
  $rr $mr "println(mutate($lr, mutations=$MuSetSize,folder=\"\",prefix=\"${TSetPrefix}_MU_\"));" &> $fMuRsl
  if [[ $? -gt 0 ]]; then
    echoerr "Error doing the mutation process."
    exit 1
  fi

  cat $fMuRsl

  mrRsl=`grep -o '^\[\".*\"\]' $fMuRsl`
else
  echo "Coping mutation from $useCacheMut..."
  cp $useCacheMut/*.rsc $bDir/
  
  #Gen. mu list
  tv=`find $useCacheMut/ -maxdepth 1 -type f -name '*.rsc' -exec printf '{}","' \; | $sed -e "s@$useCacheMut\/@@g" -e "s@\/@@g"`
  ltv=${#tv}
  ltv=$((ltv-3))
  mrRsl="[\"${tv:0:$ltv}\"]"
fi

echo -e "\nMutation list: $mrRsl"
echo $mrRsl | cut -d' ' -f2 | $sed -e 's/\"//g' -e's/\[//g' -e's/\]//g' -e's/,/\n/g' > /tmp/tmp_${dt}.mu
#cat /tmp/tmp_${dt}.mu
#$rr $mr "mutate($lr)"
#exit 1

echo -e "\nBackuping the module under test"

bkpOrig=$bDir/${TSetPrefix}_BKP_O${dt}_${ModUnderTest}
#cp $bDir/$ModUnderTest $bkpOrig
mv $bDir/$ModUnderTest $bkpOrig
if [[ $? -gt 0 ]]; then 
  echoerr "Error doing the backup!"
  exit 1
fi

echo "Creating the result folder..."
mkdir $bDir/${TSetPrefix}${dt}

totMut=`cat /tmp/tmp_${dt}.mu | wc -l`
qtdMu=0
kMu=0
while read mu; do
  echo "Running test over mutation $mu"
  ((qtdMu++))
  #$genT $TestSet $bDir/$mu $ModFunc $TestCaseExt $TSetPrefix $dt
  MbaseName=$(basename $mu)
  MbaseName=${MbaseName%.*}
  echo "Renaming $MbaseName to $MN"
  cat $bDir/$mu | $sed -e "s/^module $MbaseName/module $MN/g" > $bDir/${ModUnderTest} 
  
  echo "Executing mutation $mu ($qtdMu)"
  rslFN=${TSetPrefix}_TS_${dt}_${mu}.rsl
  
  $runT $TestSet on true | grep -P '(TestExec|error)' > $rslFN
  if [[ $? -gt 0 ]]; then
    echoerr "Error executing the mutation!"
    cat $rslFN
    rm $rslFN
    restoreBkp
    exit 1
  fi
  
  find . -name 'TR_tmp*' -type f -delete
  find . -name '*_testSet.txt' -type f -delete
  
  cat $rslFN
  rslFN=`grep -P '\: (fail|false)' $rslFN`
  if [ ! -z "$rslFN" ]; then
    echo "Mutant $mu was killed!"
    ((kMu++))
  fi
  
  if [ ! -z $useCacheMut ]; then
    mv $bDir/$mu $bDir/${TSetPrefix}${dt}/
  fi
  
  echo -e "-- ${RED}Mu. Stats${NC}: Qtd.: $totMut, Curr. Mu: $qtdMu, Killed: $kMu"
  echo 
  
done </tmp/tmp_${dt}.mu

echo 
echo "Number mutants: $qtdMu"
echo "Killed mutants: $kMu"

#cp $bkpOrig $bDir/${ModUnderTest}
restoreBkp
echo "Moving result files..."
mv ${TSetPrefix}_* $bDir/${TSetPrefix}${dt}
echo "Done!"