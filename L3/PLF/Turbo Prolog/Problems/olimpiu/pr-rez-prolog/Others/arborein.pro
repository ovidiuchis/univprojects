domains
	E = integer
	arbore = arb(E,arbore,arbore);nil
predicates
	invers(arbore,arbore)
clauses
	invers(arb(E,nil,nil),arb(E,nil,nil)).
	invers(arb(E,S,D),X):-
		invers(S,X1),
		invers(D,X2),
		X=arb(E,X2,X1).	