gs=/opt/local/bin/gsed

GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   sed=sed
   time=time
elif [[ "$unamestr" == 'Darwin' ]]; then
   sed=gsed
   time=gtime
fi

echoerr() { cat <<< "$@" 1>&2; }

minI() {
  local m=$1
  for num in $@
  do
    [ $num -lt $m ] && m=$num
  done
  echo $m
}

maxI() {
  local m=$1
  for num in $@
  do
    [ $num -gt $m ] && m=$num
  done
  echo $m
}

bcExp() {
  echo `echo "$1" | bc -l`
}

#Remove leading whitespaces
lTrim() {
  echo `echo -e "$1" | $gs -e 's/^[[:space:]]*//'`
}

#Remove trailing whitespaces
tTrim() {
  echo `echo -e "$1" | $gs -e 's/[[:space:]]*$//'`
}

#Remove both whitespaces
trim() {
  echo `echo -e "$1" | $gs -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'`
}