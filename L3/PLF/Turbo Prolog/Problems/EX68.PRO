%P3.7

domains
	arbore=arb(integer,arbore,arbore);nil
	list=integer*
predicates
	preordine(arbore,list)
	conc(list,list,list)
clauses
	conc([],L,L).
	conc([X|L1],L2,[X|L3]):-
		conc(L1,L2,L3).
	preordine(nil,[]).
	preordine(arb(R,S,D),L):-
		preordine(S,L1),
		preordie(D,L2),
		conc([R],L2,L3),
		conc(L3,L1,L).