domains 
  el=integer
  list=el*
predicates
  mult(list,list)
  member(el,list)
  egal(list,list)
clauses
  member(E,[E|_]):-!.
  member(E,[_|T]):-member(E,T).
  mult([],L):-!.
  mult([H|T],L):-member(H,L),mult(T,L).
  egal(L1,L2):- mult(L1,L2),mult(L2,L1).
