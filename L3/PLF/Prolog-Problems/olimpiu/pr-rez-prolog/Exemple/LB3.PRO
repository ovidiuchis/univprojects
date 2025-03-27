/*Problema 5.b din P1: 
Sa se calculeze suma alternanta a elementelor 
unei liste.  (l1-l2+l3..)   */

domains
  list=integer*
  
predicates
  suma(list,integer)
  
clauses
   suma([L|[]],L).
   suma([L|REST],S):-suma(REST,S1),S=L-S1.  

