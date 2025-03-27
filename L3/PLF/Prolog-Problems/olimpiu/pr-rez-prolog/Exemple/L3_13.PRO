
domains
  list=integer*
predicates
  schimba(integer,integer,list,list)
clauses
  schimba(_,_,[],[]).
  schimba(X,Y,[X|L1],[Y|L2]):-
     schimba(X,Y,L1,L2).
  schimba(X,Y,[Z|L1],[Z|L2]):-
     Z<>X,
     schimba(X,Y,L1,L2).