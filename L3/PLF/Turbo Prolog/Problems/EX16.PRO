/*Lista permutarilor unei liste date*/

domains
	elem=integer
	list=elem*
	listd=list*
predicates
	perm(list,list)
	permutari(list,listd)
	inserare(elem,list,list)
clauses
	inserare(E,L,[E|L]).
	inserare(E,[H|T],[H|T1]):-
		inserare(E,T,T1).
	perm([],[]).
	perm([H|T],L):-
		perm(T,L1),
		inserare(H,L1,L).
	permutari(L,Ld):-findall(P,perm(L,P),Ld).