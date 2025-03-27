domains
	lista = integer*
predicates
	elimina(lista, integer, integer, integer, lista)
	gaseste(lista, integer, integer, integer)
	secvente(lista, lista, integer, integer, integer, lista)
	curata(lista, lista)
clauses
	curata(L, LRez):-
		gaseste(L, 0, 0, Lung),
		secvente(L, L, 1, -1000, Lung, LRez).
	
	secvente(L, [], I, J, Lung, LRez):-
		K = I - 1,
		J > 0,
		(K - J) + 1 = Lung,
		elimina(L, 1, J, K, LL),
		LRez = LL,!.
	secvente(L, [], _, _, _, L):-!.
	secvente(L, [H|T], I, J, Lung, LRez):-
		H mod 2 = 0,
		J = -1000,
		II = I + 1,
		secvente(L, T, II, I, Lung, LRez),!.
	secvente(L, [H|T], I, J, Lung, LRez):-
		H mod 2 = 0,
		J > 0,
		II = I + 1,
		secvente(L, T, II, J, Lung, LRez),!.
	secvente(L, [H|_], I, J, Lung, LRez):-
		H mod 2 = 1,
		J > 0,
		K = I - 1,
		(K - J) + 1 = Lung,
		elimina(L, 1, J, K, LL),
		secvente(LL, LL, 1, -1000, Lung, LRez),!.
	secvente(L, [H|T], I, J, Lung, LRez):-
		H mod 2 = 1,
		K = I - 1,
		(K - J) + 1 <> Lung,
		II = I + 1,
		secvente(L, T, II, -1000, Lung, LRez).

	gaseste([], M, MTmp, Mrez):-
		M > MTmp,
		MRez = M,!.
	gaseste([], M, MTmp, Mrez):-
		M <= MTmp,
		MRez = MTmp,!.
	gaseste([H|T], M, MTmp, MRez):-
		H mod 2 = 0,
		MM = M + 1,
		gaseste(T, MM, MTmp, MRez),!.
	gaseste([H|T], M, MTmp, MRez):-
		H mod 2 = 1,
		M > MTmp,
		gaseste(T, 0, M, MRez),!.
	gaseste([H|T], M, MTmp, MRez):-
		H mod 2 = 1,
		M <= MTmp,
		gaseste(T, 0, MTmp, Mrez),!.
		
	elimina([], _, _, _, []):-!.
	elimina([H|T], I, J, K, R):-
		I < J,
		II = I + 1,
		elimina(T, II, J, K, Rnou),
		R = [H|Rnou],!.
	elimina([_|T], I, J, K, R):-
		J <= I,
		I <= K,
		II = I + 1,
		elimina(T, II, J, K, R),!.
	elimina([H|T], I, J, K, R):-
		K < I,
		II = I + 1,
		elimina(T, II, J, K, Rnou),
		R = [H|Rnou],!.
