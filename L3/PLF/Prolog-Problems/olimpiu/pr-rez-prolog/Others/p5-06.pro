%Sa se genereze toate subsirurile de lungime 2n+1, formate doar din 0, -1 sau 1,
%astfel incat a1 = 0, ..., a2n+1 = 0 si |a(i+1) - ai| = 1 sau 2, pentru orice
%1 <= i <= 2n.
domains
  el=integer
  lista=el*
predicates
  nondeterm subsir(el,lista)
  nondeterm creeaza(integer,lista)
  nondeterm getelem(lista,integer)
  exclude(integer,lista,lista)
  adauga_sf(integer,lista,lista)
  valid(integer,lista)
  nondeterm permutare(lista,lista,integer)
  nondeterm ok(integer)
  length(lista,integer)
  validare(integer,lista)
  validprim(lista)
clauses
  length([],0):-!.
  length([_|T],L):-length(T,L1),L=L1+1.
  valid(E,[H|T]):-T=[],abs(E-H)=1,!.
  valid(E,[H|T]):-T=[],abs(E-H)=2,!.
  valid(E,[_|T]):-valid(E,T).
  validprim([H|_]):-H=0,!.
  validare(_,L):-length(L,X),X=0,!.
  validare(E,L):-validprim(L),valid(E,L).
  ok(-1).
  ok(0).
  ok(1).
  creeaza(-1,[-1]):-/*ok(X),*/!.
  creeaza(N,[N|T]):-/*ok(X),N1=N-1,*/creeaza(N1,T).
  getelem([H|_],H).
%  getelem([_|T],X):-getelem(T,X).
  exclude(E,[E|T],T):-!.
%  exclude(E,[H|T],[H|L]):-exclude(E,T,L).
  adauga_sf(E,[],[E]).
  adauga_sf(E,[H|T],[H|T1]):-adauga_sf(E,T,T1).
  permutare([],[],_).
  permutare(L1,L2,N):-N>0,N1=N-1,exclude(_,L1,L3),permutare(L3,L4,N1),validare(-1,L4),adauga_sf(-1,L4,L2).
  permutare(L1,L2,N):-N>0,N1=N-1,exclude(_,L1,L3),permutare(L3,L4,N1),validare(0,L4),adauga_sf(0,L4,L2).
  permutare(L1,L2,N):-N>0,N1=N-1,exclude(_,L1,L3),permutare(L3,L4,N1),validare(1,L4),adauga_sf(1,L4,L2).
  subsir(N,L):-N1=2*N,N2=N1-2,creeaza(N1,L1),permutare(L1,L2,N1),validare(0,L2),adauga_sf(0,L2,L).
goal:
  subsir(2,X).