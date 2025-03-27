/*Sa se scrie un predicate care avand ca argument
o lista numerica produce ca rezultat lista sortata.*/

domains
	elem=integer
	list=elem*
predicates
	sortare(list,list)
	insert(elem,list,list)
clauses
	sortare([],[]).
	sortare([H|T],L):-
		sortare(T,L1),
		insert(H,L1,L).
	insert(A,[],[A]).
	insert(A,[B|L],[A|[B|L]]):-
		A<B,
		!.
	insert(A,[B|L],[B|L]):-
		A=B,
		!.
	insert(A,[B|L],[B|L1]):-
		insert(A,L,L1).