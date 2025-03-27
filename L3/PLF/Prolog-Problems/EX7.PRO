/*Sa se calculeze lungimea unei liste*/

domains
	elem=integer
	lista=elem*
predicates
	lungime(lista,elem)
clauses
	lungime([],0).
	lungime([_|T],N):-
		lungime(T,N1),
		N=N1+1.