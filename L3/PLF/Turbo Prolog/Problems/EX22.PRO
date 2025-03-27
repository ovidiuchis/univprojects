/*Sa se scrie un predicate care sa fie adevarat
daca elementele unei liste numerice sunt
ordonate crescator.*/

domains
	elem=integer
	list=elem*
predicates
	crescator(list)
clauses
	crescator([_]).
	crescator([A|[B|T]]):-
		A<=B,
		crescator([B|T]).