/*Maximul dintr-oi lista de numere intregi*/

domains
	elem=integer
	list=elem*
predicates
	maxim(list,elem)
clauses
	maxim([],-32000).
	maxim([H|T],M):-
		maxim(T,M),
		M>H,
		!.
	maxim([H|_],H).