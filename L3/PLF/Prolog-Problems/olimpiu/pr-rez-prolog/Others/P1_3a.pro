domains
	list=integer*
predicates
	insereaza(list,integer,integer,list)/* integer1-pozitia*/
	lucru(list, integer, integer, list)

clauses
	insereaza(L, Poz, Elem, Lrez):-
		lucru(L, Poz, Elem, Lrez).

	lucru([], 0, Elem, [Elem]):-!.
	lucru(L, Poz, Elem, Lrez):-
		Poz = 0,
		Lrez = [Elem|L].
	lucru([H|T], Poz, Elem, Lrez):-
		N = Poz-1,
		lucru(T, N, Elem, Lnou),
		Lrez = [H|Lnou],!.