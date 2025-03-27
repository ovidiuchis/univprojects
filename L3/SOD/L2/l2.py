import sys
from string import punctuation

for arg in sys.argv:
 fisier = open(arg,"r")
 j=0
 for line in fisier:
   ls= line.split()
   i=0
   j=j+1
   while (i< len(ls)-1):
    if (ls[i]==ls[i+1]):
       print "nr linie: %d | %s  "% (j,line) 
       i=len(ls)
    i=i+1


