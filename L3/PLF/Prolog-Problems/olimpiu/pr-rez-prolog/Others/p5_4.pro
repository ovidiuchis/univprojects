%Dandu-se o valoare N se cere sa se genereze toate
%permutarile de N elemente cu proprietatea ca oricare
%ar fi 2<=i<=N exista un 1<=j<i astfel incat
%|v(i)-v(j)|=1

domains
  el=integer
  lista=el*
predicates
  permutare(lista,lista)
  creeaza(integer,lista)
  getelem(lista,integer)
  exclude(integer,lista,lista)
  adauga_sf(integer,lista,lista)
  valid(integer,lista)
  permutari(integer,lista)
clauses
  valid(E,[]).
  valid(E,[H|T]):-abs(H-E)=1,!.
  valid(E,[H|T]):-not(T=[]),valid(E,T).
  creeaza(1,[1]):-!.
  creeaza(N,[N|T]):-N1=N-1,creeaza(N1,T).
  getelem([H|T],H).
  getelem([H|T],X):-getelem(T,X).
  exclude(E,[E|T],T):-!.
  exclude(E,[H|T],[H|L]):-exclude(E,T,L).
  adauga_sf(E,[],[E]).
  adauga_sf(E,[H|T],[H|T1]):-adauga_sf(E,T,T1).
  permutare([],[]).
  permutare(L1,L2):-getelem(L1,E),exclude(E,L1,L3),permutare(L3,L4),valid(E,L4),adauga_sf(E,L4,L2).
  permutari(N,L):-creeaza(N,L1),permutare(L1,L).