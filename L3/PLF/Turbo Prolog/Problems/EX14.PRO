/*Sa se scrie un predicat nedeterminist care
insereaza un element, pe rand, pe toate pozitiile
dintr-o lista.*/

domains
	elem=integer
	list=elem*
predicates
	insert(elem,list,list)
clauses
	insert(E,L,[E|L]).
	insert(E,[H|T],[H|T1]):-
		insert(E,T,T1).