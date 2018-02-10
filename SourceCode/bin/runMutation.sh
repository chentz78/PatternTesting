#!/bin/bash

source envVar.sh

rr=$BASEDIR/bin/runRascal.sh
mr=$BASEDIR/RascalCode/ModuleMutator.rsc

ModUnderTest="$1"
MuSetSize="$2"
FSet="$3"
TSetPrefix="$4"

bDir=$PWD
lr="|file://$bDir/$ModUnderTest|"

$rr $mr "println(mutate($lr, mutations=$MuSetSize,folder=\"\",prefix=\"${TSetPrefix}_MU_\",onlyFuncSet={${FSet}}));"
if [[ $? -gt 0 ]]; then
  echoerr "Error doing the mutation process."
  exit 1
fi