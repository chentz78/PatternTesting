#!/bin/bash

if [ -z "$R_SHELLF" ]; then
  #R_SHELLF=rascal-0.6.2.jar
  #R_SHELLF=rascal-0.6.2.201406231225.jar #Early version of kwParams
  #R_SHELLF=rascal-shell-current.jar
  #R_SHELLF=rascal-shell-stable-site.jar
  #R_SHELLF=rascal-cleverton.jar
  #R_SHELLF=rascal-shell-0.7.2.qualifier-1.jar
  #R_SHELLF=rascal-shell-30d5a90.jar
  #R_SHELLF=rascal-0.8.4-20170607.195839-111.jar
  #R_SHELLF=rascal-0.8.4-20170622.094421-159.jar
  source envVar.sh
  R_SHELLF=$RASCALBIN
fi

echo "Rascal Shell File: $R_SHELLF"
R_MODULE=""
[[ -z $JPARS ]] && JPARS="-Xms128m -Xmx640m -Xss4096k"

if [ "$#" -ne 0 ]; then
    if [[ $1 =~ "I@" ]]; then
      R_MODULE=`echo $1 | cut -d'@' -f2`
    else
      if [ "$1" == "@" ]; then
        R_MODULE='util::Math'
      else
        B_FOLDER=$(dirname $1)
        R_MODULE=$(basename $1)
        R_MODULE=${R_MODULE%.*}
        cd $B_FOLDER
      fi
    fi
    
    if [ "$2" == "latex" ]; then
      echo "Base dir:`pwd`"
      java $JPARS -jar $R_SHELLF -latex $R_MODULE
      exit 0
    fi
    
    if [ -z "$2" ]; then
      R_FUNC='main();'
    else
      if [ "$2" == "test" ]; then
        R_FUNC=':test'
      else
        if [ ! -z "$3" ]; then
          R_FUNC="$2($3)"
        else
          R_FUNC="$2"
        fi
      fi
    fi
    
    #echo $B_FOLDER
    #echo $R_MODULE
    #echo $R_FUNC
    echo "Base dir:`pwd`"
    java $JPARS -jar $R_SHELLF <<EOF
import IO;
import $R_MODULE;
$R_FUNC
EOF
else
  echo "Rascal Path: $R_PATH"
  java $JPARS -jar $R_SHELLF
fi