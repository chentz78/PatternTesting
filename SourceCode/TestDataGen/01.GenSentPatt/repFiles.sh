#!/bin/bash
while read p
do
  lua replace.lua out/sen_Concrete_$p.out repRascalR.lua out/sen_Concrete_$p.rep
done < $1