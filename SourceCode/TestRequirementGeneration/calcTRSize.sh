#!/bin/bash

n=$1
k=$2

if [ -z $k ]; then
  k=2
  v1=`calc.lua "printBN(bin($n,$k)*BN.pow(2,$k))"`
  k=$n
  v2=`calc.lua "printBN(bin($n,$k)*BN.pow(2,$k))"`
  v3=$((n*2))
  echo "PCC: $n, PECCC: $v3, PWPCC: $v1, APCCC: $v2"
else
  calc.lua "printBN(bin($n,$k)*BN.pow(2,$k))"
fi