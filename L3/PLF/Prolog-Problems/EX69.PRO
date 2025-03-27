%P3.7

domains
	arbore=arb(integer,arbore,arbore);nil
	list=integer*
predicates
	conc(list,list,list)
	postordine(arbrore,list)
clauses
	conc([],L,L).
	conc([X|L1],L2,[X|L3]):-
		conc(L1,L2,L3).
	postordine(nil,[]).
	postordine(arb(R,S,D),L):-
		postordine(S,L1),
		postordine(S,L2),
		conc(L1,L2,L3),
		conc(L3,[R],L).