
/*p4 prb 9*/
domains
	element=integer
	list=element*
predicates
	prim(integer,integer,integer)
	adaug_sf(element,list,list)
	divizor(integer,list)
	divizori(integer,list,list,integer)
	append(list,list,list)
	adaug_div(list,list,list)
clauses
	prim(0,0,_):-!.
	prim(1,0,_):-!.
	prim(H,0,I):-I<H, H mod I = 0 , !.
	prim(H,N,I):-I < H,I1=I+1,prim(H,N,I1).
	prim(H,1,H).
	adaug_sf(E,[],[E]).
	adaug_sf(E,[H|T],[H|T1]):-adaug_sf(E,T,T1).
	divizor(E,L):-divizori(E,[],L,1).
	divizori(E,L,L,F):-F=E+1,!.
	divizori(E,L1,L,I):-I<=E,E mod I =0,adaug_sf(I,L1,L2),I1=I+1,divizori(E,L2,L,I1),!.
	divizori(E,L1,L,I):-I<=E,I1=I+1,divizori(E,L1,L,I1).
	append([],L,L).
	append([H|T],L,[H|T1]):-append(T,L,T1).
	adaug_div([],L,L).
	adaug_div([H|T],L1,L):-prim(H,N,2),N=0,adaug_sf(H,L1,L2),divizor(H,L3),append(L2,L3,L4),adaug_div(T,L4,L),!.
	adaug_div([H|T],L1,L):-adaug_sf(H,L1,L2),adaug_div(T,L2,L).