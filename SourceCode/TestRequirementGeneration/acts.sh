#!/bin/bash
jACTS=ACTS3.0/acts_3.0.jar
java -Doutput=csv -jar $jACTS $1
head -n8 output.txt
