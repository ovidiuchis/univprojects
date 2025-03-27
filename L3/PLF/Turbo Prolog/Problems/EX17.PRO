/*Permutari varianta a doua*/

domains
	elem=integer
	list=elem*
	listd=list*
predicates
	elimin(elem,list,list)
	perm(list,list)
	permutari(list,listd)
clauses
	elimin(E,[E|T],T).
	elimin(E,[H|T],[H|T1]):-
		elimin(E,T,T1).
	perm([],[]).
	perm([H|T],L):-
		perm(T,L1),
		elimin(H,L,L1).
	permutari(L,Ld):-findall(P,perm(L,P),Ld).