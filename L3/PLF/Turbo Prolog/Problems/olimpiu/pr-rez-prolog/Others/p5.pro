domains
  el=integer
  lista=el*

predicates
  member(el,lista)
  candidat(el,lista)
  numere(lista,el,el,el,el)
  lungime(lista,el)
  solutie(lista,lista,el,lista)
  verif(lista)
  sol(lista,el)
  afis(lista)
  final(el)
clauses
  afis([]):-nl.
  afis([1|T]):-write('('), afis(T).
  afis([0|T]):-write(')'), afis(T).
  lungime([],0).
  lungime([H|T],X):-lungime(T,X1),X=X1+1.
  member(E,[E|_]).
  member(E,[H|T]):-member(E,T).    
  candidat(E,L):- member(E,L).
  numere([],N1,N0,N1,N0):-!.
  numere([0|T],N1,N0,M1,M0):-N01=N0+1, numere(T,N1,N01,M1,M0),!.
  numere([1|T],N1,N0,M1,M0):-N01=N1+1, numere(T,N01,N0,M1,M0),!.
  sol(L1,N):-solutie([0,1],[],N,L1).
  verif(L):-numere(L,0,0,N1,N0), N1<=N0.
  solutie(C,L,N,L):- lungime(L,M),numere(L,0,0,N1,N0),N=M,N0=N1,!,afis(L).
  solutie(L,L1,N,L2):-lungime(L1,M),M<N,candidat(E,L),verif([E|L1]),solutie(L,[E|L1],N,L2).
  final(N):-sol(L1,N).