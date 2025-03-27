/*Sa se scrie un predicat care elimina dintr-o
lista toate elmentele care se repeta.*/

domains
	elem=integer
	list=elem*
predicates
	elimina(list,list)
	apare(elem,list)
clauses
	apare(E,[E|_]).
	apare(E,[_|T]):-
		apare(E,T).
	elimina([],[]).
	elimina([E|T],T):-
		apare(E,T),
		!,
		elimina(T,T).
	elimina([E|T],[E|T1]):-
		elimina(T,T1).