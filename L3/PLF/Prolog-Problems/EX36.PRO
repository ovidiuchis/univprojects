/*Permutarile multimii 1..N,unde orice 2 elemente
consecutive sa aiba diferenta in val.absoluta>=cu
v data.*/

domains
	elem=integer
	list=elem*
predicates
	apare(elem,list)
	candidat(elem,elem)
	perm(elem,elem,list)
	perm_aux(elem,elem,list,list,elem)
clauses
	apare(E,[E|_]).
	apare(E,[_|T]):-
		apare(E,T).
	candidat(N,N).
	candidat(E,N):-
		N>1,
		N1=N-1,
		candidat(E,N1).
	perm(N,V,L):-
		candidat(E1,N),
		candidat(E2,N),
		abs(E2-E1)>=V,
		perm_aux(N,V,L,[E1,E2],2).
	perm_aux(N,_,Col,Col,N):-!.
	perm_aux(N,V,L,[H|Col],Lg):-
		candidat(E,N),
		abs(E-H)>=V,
		Lg1=Lg+1,
		perm_aux(N,V,L,[E|[H|Col]],Lg1).