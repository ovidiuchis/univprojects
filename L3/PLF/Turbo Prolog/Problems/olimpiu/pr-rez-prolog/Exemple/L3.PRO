/*                LABORATOR NR 3

    Sa se calculeze suma alternanta a elementelor unei liste.
             (l1-l2+l3..)   */



domains
  list=integer*
predicates
  suma(list,integer)
clauses
   suma([A|[]],A).
   suma([A|X],S):-suma(X,S1),S=A-S1.  

