% Se da o lista formata din intregi si liste de numere
% intregi. Sa se calculeze suma elementelor din subliste
domains
  el=integer
  lista=el*
  element=i(integer);l(lista)
  listad=element*
predicates
  suma(listad,integer)   % calculeaza suma ceruta
  s(lista,integer)       % suma elementelor dintr-o sublista
clauses
  s([],0).
  s([A|L],S):-s(L,S1),S=A+S1.
  suma([],0).
  suma([l(L)|L1],N):-s(L,N1),suma(L1,N2),N=N1+N2,!.
  suma([_|L],N):-suma(L,N).  

% goal:  suma([i(1),l([1,2,3])],N)  => N=6