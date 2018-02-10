#!/bin/bash

n=$1

echo "TS with Len(NS)=1"
calc.lua "$n+1"
echo "TS with Len(NS)=n"
calc.lua "$n*2"