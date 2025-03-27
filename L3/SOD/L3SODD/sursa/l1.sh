
#!/bin/bash
fis1=$1
fis2=$2
touch file2
nr=$#
shift 2
nr=$[ nr - 2 ]
while [ $nr -gt 0 ]
 do
  echo $1 >>file2
  shift
  nr=$[ nr - 1 ]
 done
grep [aeiou] file2> $fis1
grep -v [aeiou] file2> $fis2
rm file2 


