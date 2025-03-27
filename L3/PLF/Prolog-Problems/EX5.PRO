/*Sa se calculeze suma nr. pare dintr-un interval
 [a,b].*/
 
predicates
	  suma(integer,integer,integer)
clauses
	suma(A,B,0):-
		A>B,
		!.
	suma(A,B,S):-
		A mod 2=0,
		!,
		A1=A+1,
		suma(A1,B,S1),
		S=A+S1.
	suma(A,B,S):-
		A1=A+1,
		suma(A1,B,S).