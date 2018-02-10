#!/bin/bash
source util.sh

fg=/Users/chentz/bin/fGetLine.lua

if [ ! -e "$1" ]; then
  echo "Invalid src file 1!"
  exit 1
fi

if [ ! -e "$2" ]; then
  echo "Invalid src file 2!"
  exit 1
fi

bRTC=$1
im=$2

funcN=$(basename $im)
funcN=`echo $funcN | cut -d '_' -f 1`

dt=`date +'%Y%m%d_%H%M%S'`
tmp=/tmp/f$dt

git --no-pager diff --no-index -a --minimal $bRTC $im &> $tmp

echo "Diff output:"
tail -n 25 $tmp

lc=`cat $bRTC | wc -l`

l=`grep '@@' $tmp | head -n 4 | tail -2 | head -1`

n=`echo $l | grep -Po '\-[0-9]+' | cut -d '-' -f 2`
n=$((n+3))

tmp2=${tmp}_2
echo 
echo "Function name: $funcN"
grep -Pn -2 " ?[a-zA-Z0-9]+ $funcN\(" $bRTC &> $tmp2
echo "$n " >> $tmp2
cat $tmp2 | sort | gsed "s@$n @       ======>  $n  <======@g" | grep -3 "$n"

echo "--> Change starts in line ${n}. Move $im to MutEq?"
read y < /dev/tty
if [ "$y" == "y" ]; then
  mv $im MutEq/
  echo "File $im moved."
fi

echo "Mutation reg:"
ls -l | grep " ${funcN}" | wc -l

echo "Mutation Eq:"
find MutEq/ -name "${funcN}*" | wc -l

rm -rf $tmp