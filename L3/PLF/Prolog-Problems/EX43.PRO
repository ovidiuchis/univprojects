/*Sa se scrie un predicat care intoarce reuniunea
a doua multimi.*/

domains
	elem=integer
	list=elem*
predicates
	reun(list,list,list)
	apare(elem,list)
clauses
	apare(E,[E|_]).
	apare(E,[_|T]):-
		apare(E,T).
	reun(L,[],L).
	reun([H|L1],L2,[H|L3]):-
		!,
	     reun(L1,L2,L3).
	reun(L1,[H|L2],[H|L3]):-
		not(apare(H,L1)),
		!,
		reun(L1,L2,L3).
	 reun([H|L1],L2,[H|L3]):-
	 	reun(L1,L2,L3).
	 reun(L1,[H|L2],[H|L3]):-
	 	reun(L1,L2,L3).	