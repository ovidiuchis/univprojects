/*Sa se scrie un predicat care sa produca inversa
unei liste.*/

domains
	elem=integer
	list=elem*
predicates
	adaug(elem,list,list)
	invers(list,list)
clauses
	adaug(E,[],[E]).
	adaug(E,[H|T],[H|T1]):-
		adaug(E,T,T1).
	invers([],[]).
	invers([H|T],L):-
		invers(T,L1),
		adaug(H,L1,L).