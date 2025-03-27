/*P2.9.Interclasare cu pastrarea dublurilor.*/

domains
	elem=integer
	list=elem*
predicates
	interc(list,list,list)
clauses
	interc([],L,L):-!.
	interc(L,[],L).
	interc([H1|T1],[H2|T2],[H1|T3]):-
		H1<H2,
		interc(T1,[H2|T2],T3),
		!.
	interc([H1|T1],[H2|T2],[H2|T3]):-
		H2<H1,
		interc([H1|T1],T2,T3),
		!.
	interc([H1|T1],[H2|T2],[H1|T3]):-
		H1=H2,
		interc(T1,T2,T3),
		!.