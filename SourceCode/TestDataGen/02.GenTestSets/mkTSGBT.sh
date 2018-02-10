#!/bin/bash
#1 -> Mod Folder

fMod=$1
rRSO=$2

if [[ -z $fMod ]]; then
  echo "Invalid input."
  exit 1
fi

TSN=GBT
[ -z $rRSO ] && rRSO=${TSN}.rsc

touch $rRSO

echo "module $TSN" > $rRSO
echo  >> $rRSO
echo "import IO;" >> $rRSO
echo "import StaticTestingUtilsLocal;" >> $rRSO
echo  >> $rRSO

cat <<EOF >> $rRSO 
bool tMNOK(loc m) {
  if (!exists(m)) {
    println("tMNOK: Invalid file! <m> ");
    return false;
  }
  
  try {
    if (checkModuleOK(m) ) return false;
  } 
  catch IO(_) : { return false; }
  catch e : { return true; }
  return true;
}
EOF

echo  >> $rRSO

fPath="$fMod/"
c=1
while read l; do
  fn=$(basename $l)
  bn=${fn%.*}
  echo "$fn - $bn - $c"
  #mLoc="|file://$l|"
  mLoc="|cwd:///$l|"
  echo "test bool tc${bn}() = tMNOK($mLoc);" >> $rRSO
  c=$((c+1))
done  < <(find $fPath -maxdepth 1 -iname '*.rsc' | gsed 's@//@/@g' | sort)

echo "TestSet size: $((c-1))"
echo "Done!"