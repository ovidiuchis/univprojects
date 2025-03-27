/*combinari*/

domains
	elem=integer
	list=elem*
predicates
	comb(list,elem,list)
clauses
	comb([H|T],1,[H]).
	comb([_|T],K,L):-
		comb(T,K,L).
	comb([H|T],K,[H|T1]):-
		K<>1,
		K1=K-1,
		comb(T,K1,T1).