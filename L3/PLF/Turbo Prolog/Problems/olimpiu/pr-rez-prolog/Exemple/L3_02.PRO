/* predicat care intoarce suma elementelor dintr-o lista */
domains
  list=integer*
predicates
  suma(list,integer)
clauses
  suma([],0).
  suma([H|T],S):-
                 suma(T,S1),
                 S=S1+H.