%Sa se genereze toate subsirurile de lungime 2n+1, formate doar din 0, -1 sau 1,
%astfel incat a1 = 0, ..., a2n+1 = 0 si |a(i+1) - ai| = 1 sau 2, pentru orice
%1 <= i <= 2n.

%trace
domains
  el=integer
  lista=el*

predicates
  subsir(el,lista)
  creez(integer,lista)
  getelem(lista,integer)
  exclude(integer,lista,lista)
  adauga_sf(integer,lista,lista)
  valid(integer,lista)
  permutare(lista,lista,integer)
  ok(integer)
  length(lista,integer)
  validare(integer,lista)
  validprim(lista)
  validim(lista)
 
clauses

%calculez lungimea listei 
  length([],0):-!.
  length([_|T],L):-length(T,L1),L=L1+1.
  
%verific conditia pt E si ultimul elem din lista
%adaug la final si verific mereu cond cu ultimul element
%cond e adevarata pt elem consecutive
%e valid cand lista are un elem (deci ultimul)&abs(e&ultimul)=1 sau 2
  valid(E,[H|T]):- T=[],abs(E-H)=1,!.
  valid(E,[H|T]):- T=[],abs(E-H)=2,!.
  valid(E,[_|T]):- valid(E,T).
  
  validim([]).
  validim([H|T]):- 
     length(T,A),A mod 2=1,H=0,validim(T).
  validim([_|T]):- 
     length(T,A),A mod 2=0,validim(T).  
  
  
%la adaugarea la final,verific dc e ramane valabila conditia
%vaidare adevarata dc lare 0 elem sau daca valid e true
  validprim([H|_]):- H=0,!.
  validare(_,L):- length(L,X), X=0 ,!.
  validare(E,L):- 
      validprim(L),
      valid(E,L).
  
%creez lista initiala   
%pun de fapt intr-o lista pozitiile elem in ordine descrescatoare
  ok(-1).
  ok(0).
  ok(1).
  creez(-1,[-1]).
  creez(N,[N|T]):- N1=N-1, creez(N1,T).

%return elem cu elem lista
  getelem([H|_],H).
  getelem([_|T],X):-getelem(T,X).

%exclud elem E din lista 1==>lista2
  exclude(E,[E|T],T):-!.
  exclude(E,[H|T],[H|L]):- exclude(E,T,L).

%adaug E la finalul liste 1==>lista2  
  adauga_sf(E,[],[E]).
  adauga_sf(E,[H|T],[H|T1]):-adauga_sf(E,T,T1).

  permutare([],[],_).
  permutare(L1,L2,N):-
               N>0,
               N1=N-1,
               exclude(_,L1,L3),
               permutare(L3,L4,N1),
               validare(-1,L4),
               adauga_sf(-1,L4,L2).
  permutare(L1,L2,N):-
               N>0,
               N1=N-1,
               exclude(_,L1,L3),
               permutare(L3,L4,N1),
               validare(0,L4),
               adauga_sf(0,L4,L2).
  permutare(L1,L2,N):-
               N>0,
               N1=N-1,
               exclude(_,L1,L3),
               permutare(L3,L4,N1),
               validare(1,L4),
               adauga_sf(1,L4,L2).
  subsir(N,L):-N=0,
               L=[0].
  subsir(N,L):-N>0,
               N1=2*N-2,
               creez(N1,L1),
               N2=N1+2,
               permutare(L1,L2,N2),
               validim(L2),
               validare(0,L2),
               adauga_sf(0,L2,L).
            

