domains
	el =  symbol
	arbore = arb(el,arbore,arbore);nil
predicates
	creaza(el,arbore)
	inss(arbore,arbore,arbore)
	insd(arbore,arbore,arbore)
	numara(arbore,integer)
clauses
	creaza(E,arb(E,nil,nil)).
	inss(A,arb(E,_,D),arb(E,A,D)).
	insd(A,arb(E,S,_),arb(E,S,A)).
	numara(nil,0).
	numara(arb(_,S,D),X):-
		numara(S,X1),
		numara(D,X2),
		X = 1 + X1 + X2.
		