#!/bin/bash
#1 -> Rascal Test Set file
#2 -> TS Name
#3 -> SS File
#4 -> Base name or function name

fRTS=$1
fname=$(basename "$fRTS")

cp $fRTS .

runRascal.sh $fname test

rm -rf $fname