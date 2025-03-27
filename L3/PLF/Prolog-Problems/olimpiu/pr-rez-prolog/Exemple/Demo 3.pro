% Se da o lista formata din liste de numere intregi. 
% Se cere sublista de suma maxima. 
domains
  lista=integer*
  listad=lista*
predicates
  suma(lista,integer)
  sublista(listad,lista)
clauses
  suma([],0):-!.
  suma([A|L],S):-suma(L,S1),S=A+S1.
  sublista([],[]):-!.
  sublista([L1|L2],L1):-sublista(L2,L3),suma(L1,S1),suma(L3,S2),S1>S2,!.
  sublista([_|L],L1):-sublista(L,L1).

% Apel la executie Goal: sublista([[1,2],[-1,5]],L1)
%      se va afisa L1=[-1,5]               
     