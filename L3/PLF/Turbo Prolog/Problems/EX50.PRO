/*P1.15b)Sa se calculeze suma alternanta a 
elementelor.*/

domains
	elem=integer
	list=elem*
predicates
	suma(list,elem)
clauses
	suma([],0).
	suma([H|T],S):-
		suma(T,S1),
		S=H-S1.