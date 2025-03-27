domains
	list=integer*
predicates
	cmmdc(integer,integer,integer)/*cmmdc(a,b,rez)*/
	cmmdcList(list,integer)
clauses
	cmmdc(A, B, Rez):-
		A = B,
		Rez = B,!.
	cmmdc(A, B, Rez):-
		B>A,
		C = B-A,
		cmmdc(C, A, Rez).
	cmmdc(A, B, Rez):-
		A>B,
		C = A-B,
		cmmdc(C, B, Rez).
	cmmdcList([H],H):-!.
	cmmdcList([H1|[H2|T]],Rezult):-
		cmmdc(H1,H2,Rez),
		cmmdcList([Rez|T],Rezult).