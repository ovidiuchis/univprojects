/* predicat care determina daca un element este membru al unei liste */
domains
  lista=integer*
predicates
  membru(integer,lista)
clauses
  membru(E,[E|_]).
  membru(E,[_|T]):-
                   membru(E,T).