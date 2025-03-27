/*p1.6a)Sa se scrie un predicat care intoarce
intewrsectia a doua multimi.*/

domains
	elem=integer
	list=elem*
predicates
	inters(list,list,list)
	apare(elem,list)
clauses
	apare(E,[E|_]).
	apare(E,[_|T]):-
		apare(E,T).
	inters([],L,[]).
	inters([H|L1],L2,[H|L3]):-
		apare(H,L2),
		!,
		inters(L1,L2,L3).
	inters([H|L1],L2,L3):-
		inters(L1,L2,L3).