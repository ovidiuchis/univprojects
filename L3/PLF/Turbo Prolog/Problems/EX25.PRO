/*Sa se scrie un predicat care avand ca argument
o lista formata din simboluri,produce ca rezultat
al n-lea element din lista.*/

domains
	elem=symbol
	list=elem*
predicates
	select(list,integer,elem)
clauses
	select([H|T],1,H):-!.
	select([_|T],N,S):-
		N1=N-1,
		select(T,N1,S).