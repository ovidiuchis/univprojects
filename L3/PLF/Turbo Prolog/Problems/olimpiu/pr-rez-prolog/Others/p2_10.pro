domains 
	list = integer*
predicates
	inter(list, list, list)
clauses
	inter([], L2, L2):-!.
	inter(L1, [], L1):-!.
	inter([H1|T1], L2, [H3|T3]):-
		H1 = H3,
		inter(T1, L2, [H3|T3]),!.
	inter(L1, [H2|T2], [H3|T3]):-
		H2 = H3,
		inter(L1, T2, [H3|T3]),!.
	inter([H1|T1], [H2|T2], L3):-
		H1 < H2,
		inter(T1, [H2|T2], Lnou),
		L3 = [H1|Lnou],!.
	inter([H1|T1], [H2|T2], L3):-
		H2 < H1,
		inter([H1|T1], T2, Lnou),
		L3 = [H2|Lnou],!.