/* Suma primelor n numere iterativ*/

predicates
	 suma(integer,integer) %(i,o)
	 suma_aux(integer,integer,integer,integer)
	 %(i,o,i,i)
clauses
	suma(N,S):-
		suma_aux(N,S,0,0).
	suma_aux(N,S,N,S).
	suma_aux(N,S,I,Sum):-
			I<N,
			I1=I+1,
			Sum1=Sum+I1,
			suma_aux(N,S,I1,Sum1).