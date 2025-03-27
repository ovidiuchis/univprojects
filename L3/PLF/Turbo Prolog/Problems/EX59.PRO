/*P2.6.Predicat de egalitate si mai mic pentru
numere reprezentat in lista.*/

domains
	elem=integer
	list=elem*
predicates
	egal(list,list)
	maimic(list,list)
clauses
	egal([],[]).
	egal([H|T],[H1|T1]):-
		H=H1,
		!,
		egal(T,T1).
	egal([H|T],[H1|T1]):-
		H<>H1,
		fail.
	maimic([],[]).
	maimic([H|T],[H1|T1]):-
		H<H1,
		!,
		maimic(T,T1).
	maimic([H|T],[H1|T1]):-
		not(egal(T,T1)),
		maimic(T,T1).