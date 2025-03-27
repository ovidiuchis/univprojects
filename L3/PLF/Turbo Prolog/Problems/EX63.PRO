/*P2.12.Sa se inlocuiasca toate aparittile unui
element E cu elementele unui liste L1*/

domains
	elem=integer
	list=elem*
predicates
	inloc(list,elem,list,list)
	pune(list,list,list)
clauses
	pune([],L,L):-!.
	pune(L,[],L).
	pune([H|T],[H1|T1],[H1|T2]):-
		pune([H|T],T1,T2).
	inloc([],_,_,[]):-!.
	inloc(L,_,[],L):-!.
	inloc([H|T],E,L1,Rez):-
		H=E,
		inloc(T,E,L1,Rez1),
		pune(Rez1,L1,Rez).
	inloc([H|T],E,L1,[H|Rez]):-
		H<>E,
		inloc(T,E,L1,Rez).