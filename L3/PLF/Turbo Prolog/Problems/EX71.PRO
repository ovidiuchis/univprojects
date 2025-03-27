%P3.9

domains
	arbore=arb(integer,arbore,arbore);nil
predicates
	adancime(arbore,integer)
clauses
	adancime(nil,0).
	adancime(arb(_,S,D),N):-
		adancime(S,N1),
		adancime(D,N1),
		N1>=N2,
		N=N1+1.
	adancime(arb(_,S,D),N):-
		adancime(S,N1),
		adancime(S,N2),
		N2>N1,
		N=N2+1.