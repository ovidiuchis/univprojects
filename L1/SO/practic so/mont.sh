#!/bin/sh
if [ $# = 0 ]
then
 echo "nu sunt parametri"
 exit
fi
for i
 do

  awk '{linie[i++]=$0} END {for (j=i-1;j>=0;) print linie[j--]}  ' $i
 done

