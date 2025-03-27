/*P1.8a)sa se scrie un predicat care intoarce
diferenta a doua multimi.*/

domains
	elem=integer
	list=elem*
predicates
	apare(elem,list)
	diferenta(list,list,list)
clauses
	apare(E,[E|_]).
	apare(E,[_|T]):-
		apare(E,T).
	diferenta([],L,[]).
	diferenta([H|L1],L2,[H|L3]):-
		not(apare(H,L2)),
		!,
		diferenta(L1,L2,L3).
	diferenta([H|L1],L2,L3):-
		diferenta(L1,L2,L3).