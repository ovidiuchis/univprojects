/*P1.13b)Sa se elimina elemetul de pe pozitia a n-a
a unei liste.*/

domains
	elem=integer
	list=elem*
predicates
	elimina(elem,list,list)
clauses
	elimina(_,[],[]).
	elimina(1,[H|T],T).
	elimina(N,[H|T],[H|L2]):-
		N>1,
		N1=N-1,
	    %	!,
		elimina(N1,T,L2).