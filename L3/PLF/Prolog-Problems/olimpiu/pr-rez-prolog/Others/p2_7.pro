domains 
	list=integer*
predicates
	inserez(integer, list, list)
	sorteaza(list, list, list)
	sort(list, list)
clauses
	inserez(H, [], [H]):-!.
	inserez(H, [H1|T], R):-
		H <= H1,
		R = [H|[H1|T]].
	inserez(H, [H1|T], RR):-
		H > H1,
		inserez(H, T, Aux),!,
		RR = [H1|Aux].
	
	sorteaza([], L, L):-!.
	sorteaza([H|T], L, R):-
		inserez(H, L, RR),
		sorteaza(T, RR, RRR),
		R = RRR,!.
		
	sort(L, R):-
		sorteaza(L, [], R).
/*
goal
	sort([6, -1, 5, 3, 6, 2, 4, 1, 0],R)		*/