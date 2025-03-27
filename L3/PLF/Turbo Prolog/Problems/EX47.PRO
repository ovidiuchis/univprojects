/*P1.4a)Sa se scrie un predicat care substituie 
intr-o lista un element cu altul.*/

domains
	elem=integer
	list=elem*
predicates
	subst(elem,elem,list,list)
clauses
	subst(_,_,[],[]).
	subst(E1,E2,[H|T],[E2|T1]):-
		E1=H,
		!,
		subst(E1,E2,T,T1).
	subst(E1,E2,[H|T],[H|T1]):-
		E1<>H,
		subst(E1,E2,T,T1).