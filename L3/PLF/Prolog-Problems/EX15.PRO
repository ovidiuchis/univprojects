/* Sa se scrie un predicat care elimina un element
dintr-o lista pe rand, de pe fiecare pozitie pe 
care apare.*/

domains
	elem=integer
	list=elem*
predicates
	elimin(elem,list,list) %(i,i,o)
clauses
	elimin(E,[E|T],T).
	elimin(E,[H|T],[H|T1]):-
		elimin(E,T,T1).