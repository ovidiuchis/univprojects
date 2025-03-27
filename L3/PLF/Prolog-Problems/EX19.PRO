/*Sa se scrie un predicat care sa se adauga un 
element la sfarsitul unei liste.*/

domains
	elem=integer
	list=elem*
predicates
	adaug(elem,list,list)
clauses
	adaug(E,[],[E]).
	adaug(E,[H|T],[H|T1]):-
		adaug(E,T,T1).