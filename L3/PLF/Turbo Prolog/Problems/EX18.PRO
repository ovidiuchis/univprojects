/*Permutari varianta a 3-a.*/

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
	perm(L,[H|T]):-
		elimin(H,L,L1),
		perm(L1,T).
	permutari(L,Ld):-findall(P,perm(P,L),Ld).