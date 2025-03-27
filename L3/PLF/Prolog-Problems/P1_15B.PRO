/*Sa se calculeze suma alternanta a elementelor
unei liste. (l1-l2+l3...)*/

domains
       elem=integer
       list=elem*
predicates
         suma(list,elem)
clauses
        suma([L|[]],L).
        suma([L|Rest],S):-
          suma(Rest,S1),
          S=L-S1.