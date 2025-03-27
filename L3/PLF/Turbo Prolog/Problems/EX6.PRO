/*Sa se calculeze suma primelor n elemente ale
unei liste.*/

domains
	elem=integer
	lista=elem*
predicates
	suma(lista,elem,elem)
	%(i,i,o)
clauses
	suma([],_,0):-!.
	suma(_,0,0):-!.
	suma([H|T],N,S):-
			N1=N-1,
			suma(T,N1,S1),
			S=H+S1.
			