#!/bin/sh
if [ $# = 0 ]
 then
  echo "Nu ati introdus parametru" 
  exit
fi
if [ ! -f $1 ]
 then
  echo "Nu exista fisierul "
  exit
fi
fisier=$1
i=0
while [ $i -lt 10 ]
 do
  touch $i
  awk  '{

       for(cuv=1;cuv<=NF;cuv++)

       {

         if(substr($cuv,1,1)=='$i')

         {print $cuv}

       }

       }'  $fisier  > {$i}
  i=$(($i+1))
 done
 i=0
 while [ $i -lt 10 ]
  do
   sort {$i} > $i
   rm -f {$i}
   i=$(($i+1))
  done
