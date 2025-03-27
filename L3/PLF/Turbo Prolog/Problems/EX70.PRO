%P3.5

domains
	arbore=arb(integer,arbore,arbore);nil
predicates
	invers(arbore,arbore)
clauses
	invers(nil,nil).
	invers(arb(R,S,D),arb(R1,S1,D1):-
		invers(S,S1),
		invers(D,D1).