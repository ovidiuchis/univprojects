/* Sa se calculeze suma primelor n numere naturale
*/

predicates
	  suma(integer,integer) %(i,o)
clauses
	suma(0,0):-!.
	suma(N,S):-
		    N1=N-1,
		    suma(N1,S1),
		    S=N+S1.		