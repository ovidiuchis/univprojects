domains 
  el=integer
  list=el*
predicates
  aln(list,el,el)
  mult(list,list)
  member(el,list)
  egal(list,list)
clauses
  aln([H|T],1,P):- P=H.
  aln([H|T],N,P):- N1=N-1,aln(T,N1,P).
  member(E,[E|_]):-!.
  member(E,[_|T]):-member(E,T).
  mult([],L):-!.
  mult([H|T],L):-member(H,L),mult(T,L).
  egal(L1,L2):- mult(L1,L2),mult(L2,L1).
