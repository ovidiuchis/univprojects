%Fiind dat un numar n pozitiv, se cere sa se determine toate descompunerile
%sale ca suma de numere prime distincte. 
domains
  el=integer
  list=el*
predicates
  nondeterm descompuneri(el,list)
  prim(el,el)
  suma(list,el)
  nrapar(list,el,el)
  distincte(list)
  listaprime(list)
  nondeterm genlist(el,list)
clauses
  prim(H,I):-I<H,I1=I+1,J=H mod I,J<>0,!,prim(H,I1).
  prim(H,H).
  suma([],0).
  suma([H|T],S):-suma(T,S1),S=S1+H.
  nrapar([],_,0).
  nrapar([H|T],E,N):-E=H,nrapar(T,E,N1),N=N1+1,!.
  nrapar([H|T],E,N):-E<>H,nrapar(T,E,N).
  distincte([]).
  distincte([H|T]):-nrapar(T,H,X),X=0,!,distincte(T).
  listaprime([]).
  listaprime([H|T]):-prim(H,2),!,listaprime(T).
  genlist(_,[]).
  genlist(N,[H|T]):-genlist(N,T).
  descompuneri(N,L):-genlist(N,L),listaprime(L),distincte(L),suma(L,N).
goal
  descompuneri(12,X).