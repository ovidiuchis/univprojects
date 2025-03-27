domains
	lista = integer*
predicates
	paranteze(integer)
	generate(lista,integer)
	ezsu(integer)
	valid(lista,integer,integer)
	afisare(lista)
clauses
	ezsu(0).
	ezsu(1).
	paranteze(N) :-
		generate(L1,N),
		valid(L1,0,0),
		afisare(L1),
		nl,
		fail.
	generate([],0):-!.
	generate([H|T],N):-
		ezsu(H),
		N1=N-1,
		generate(T,N1).
	valid([],N1,N2) :- 
		N1=N2.
	valid([1|T],N1,N2) :- 
		N1>=N2,
		N=N1+1,
		valid(T,N,N2).
	valid([0|T],N1,N2) :-
		N2<=N1,
		N=N2+1,
		valid(T,N1,N).
	afisare([]).
	afisare([0|T]):- write(')'),afisare(T).
	afisare([1|T]):- write('('),afisare(T).	