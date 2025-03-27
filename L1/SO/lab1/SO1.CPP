/*Realizam impartirea numerelor , iar rezultatul il vom inmulti cu 10 la o
putere (dupa cerinta) si fortand partea intreaga vom obtine numarul dorit de
zecimale*/

#include<stdio.h>
#include<math.h>
void main()
{int numarator,numitor,n;
   typedef unsigned long int ulint;
   printf("Dati numaratorul fractiei \n");
   scanf("%d",&numarator);
   printf("Dati numitorul fractiei \n");
   scanf("%d" ,&numitor);
   printf("Dati numarul de zecimale dorit \n");
   scanf("%d",&n);
   ulint rez;
   rez=(float(numarator)/float(numitor))*pow(10,n);//pow(baza,exponent)
   printf("Primele %d",n);
   printf(" zecimale sunt: \n");
   printf("%ld",rez);
 }