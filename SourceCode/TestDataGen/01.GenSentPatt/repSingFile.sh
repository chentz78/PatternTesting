#!/bin/bash
rf=$1
tempT=$2
outF=$3

[ -z $tempT ] && tempT=repRascalR.lua
[ -z $outF ] && outF=out.sent

lua replace.lua $rf $tempT $outF