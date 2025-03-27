/*Sa se genereze toate perechile de elem crescatoare 
dintr-o lista de nr intregi.*/

domains
	elem=integer
	list=elem*
predicates
	pereche(elem,list,list) %(i,i,o)
	perechi(list,list) %(i,o)
clauses
	pereche(E,[H|_],[E|[H]]):-
		E<H.
	pereche(E,[_|T],P):-
		pereche(E,T,P).
	perechi([H|T],P):-
		pereche(H,T,P).
	perechi([_|T],P):-
		perechi(T,P).