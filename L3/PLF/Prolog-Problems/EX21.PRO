/*Sa se scrie un predicat care produce reuniunea
a doua multimi.*/

domains
	elem=integer
	list=elem*
predicates
	apare(elem,list)
	reun(list,list,list)
clauses
	apare(E,[E|_]):-!.
	apare(E,[_|T]):-
		apare(E,T).
	reun([],L,L).
	reun([H|L1],L2,[H|L3]):-
		not(apare(H,L2)),
		!,
		reun(L1,L2,L3).
	reun([_|L1],L2,L3):-
		reun(L1,L2,L3).