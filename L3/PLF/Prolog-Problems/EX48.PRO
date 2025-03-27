/*P1.5b).Sa se elimine prima aparitie a elementului
minim dintr-o lista.*/

domains
	elem=integer
	list=elem*
predicates
	 minim(list,elem)
	 elimina(list,list)
clauses
	minim([],32000).
	minim([H|T],M):-
		minim(T,M),
		M<H,
		!.
	minim([H|_],H).
	elimina([],[]).
	elimina([H|T],L1):-
		minim([H|T],M1),
		M1=H,
		L1=T.
	elimina([H|T],L1):-
		minim([H|T],M1),
		M1<>H,
		elimina(T,L1).