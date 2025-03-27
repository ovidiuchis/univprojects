/*P1.13a)Sa se scrie un predicat care substituie
intr-o lista un element printr-o alta lista.*/

domains
	elem=integer
	list=elem*
	listd=list*
predicates
	 subst(elem,list,list,listd)
clauses
	subst(E,[_],[],[]).
	subst(E,L,[E|T],[L|T1]):-
		subst(E,L,T,T1).
	subst(E,L,[H|T],L1):-
		subst(E,L,T,L1).