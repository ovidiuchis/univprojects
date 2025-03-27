#!/bin/sh
cd ~
cd ..
for i in `ls` 
do
 cut -f 1-3 "`finger $i`" 
done

