/* Sa se scrie un predicat care adauga intr-o lista
dupa fiecare element par valoarea 1.*/

domains
	elem=integer
	list=elem*
predicates
	adaug(list,list)
clauses
	adaug([],[]).
	adaug([H|T],[H|[1|T1]]):-
		H mod 2 =0,
		!,
		adaug(T,T1).
	adaug([H|T],[H|T1]):-
		adaug(T,T1).