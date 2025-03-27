%P3.1

domains
	element=integer
	treetype=tree(element,treetype,treetype);nil
predicates
	nrnoduri(treetype,element)
clauses
	nrnoduri(nil,0).
	nrnoduri(tree(_,S,D),N):-
		nrnoduri(S,N1),
		nrnoduri(D,N2),
		N=N1+N2+1.