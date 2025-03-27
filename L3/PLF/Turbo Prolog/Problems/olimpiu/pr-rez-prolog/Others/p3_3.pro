domains
	element = integer
	arbore = arb(element, arbore, arbore);nil
predicates
	suma(arbore, integer, integer)
clauses
	suma(nil, _, 0):-!.
	suma(arb(R,S,D), Niv, Rez):-
		Niv1 = Niv +1,
		suma(S, Niv1, N),
		suma(D, Niv1, M),
		SD = M + N,
		RxNiv = R * Niv,
		Rez = SD + RxNiv.
		