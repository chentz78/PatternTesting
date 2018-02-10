#!/bin/bash
fFuncs=$1
RTCF=../RascalCode/CheckTypes.rsc
cFunc=$2
ln=$3

if [ $cFunc == "file" ]; then
  lastF=
  while read l; do
      f=`echo $l | cut -d '%' -f 1`
      pln=`echo $l | cut -d '%' -f 2`
      patt=`echo $l | cut -d '%' -f 3`
      if [ ! "$lastF" == "$f" ]; then
        echo "Function $f"
        grep -P --color -n "[a-z] $f\(" $RTCF > $ln/tmp_$f.lst
        echo "" >> $ln/tmp_$f.lst
        lastF=$f
      fi
      echo "$pln -> $patt" >> $ln/tmp_$f.lst
  done < <(cat $fFuncs | sort)
  
  while read f; do
      echo "Sorting Function $f"
      cat $ln/tmp_$f.lst | sort > $ln/f_$f.lst
  done < <(cat $fFuncs | cut -d '%' -f 1 | sort -u)
  rm -rf $ln/tmp_*.lst
else
  if [ ! -z $cFunc ]; then
    grep -P --color -n "[a-z] $cFunc\(" $RTCF 
    if [ ! -z $ln ]; then
      lc=`cat $RTCF | wc -l`
      echo 
      tail -n $((lc-ln+1+5)) $RTCF | head -n 20
    fi
  else
    while read f; do
      echo "Function $f"
      grep -P --color -n "[a-z] $f\(" $RTCF
    done < <(cat $fFuncs | cut -d '%' -f 1 | sort -u)
  fi
fi

