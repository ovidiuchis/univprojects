/*Sa se scrie un predicat care se va satisface daca
o lista are numar par de elemente si se va esua
in caz contrar.*/

domains
	elem=integer
	list=elem*
predicates
	par(list)
clauses
	par([]).
	par([_|[_|E]]):-
		par(E).