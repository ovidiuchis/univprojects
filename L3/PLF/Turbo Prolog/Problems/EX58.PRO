/*P2.3.Suma a 2 numere reprezentat in lista.*/

domains
	elem=integer
	list=elem*
predicates
	suma(list,list,list)
	suma0(list,list,list)
	inv(list,list)
	conc(list,list,list)
	adaug(elem,list,list)
clauses
	adaug(E,[],[E]).
	adaug(E,[_|T],[_|T1]):-
		adaug(E,T,T1).
	conc([],L,L).
	conc([H|L1],L2,[H|L3]):-
		conc(L1,L2,L3).
	inv([],[]).
	inv([H|L1],L2):-
		inv(L1,LL),
		conc(LL,[H],L2).
	
	suma([],[],[]).
	suma(A,B,C):-
		inv(A,A1),
		inv(B,B1),
		suma0(A1,B1,C1),
		inv(C1,C).
	suma0([],[],[]).
	suma0([H1|T1],[H2|T2],L3):-
		H1+H2<10,
		!,
		H=H1+H2,
		adaug(H,L,L3),
		suma0(T1,T2,L3).
	suma0([_|T1],[_|T2],[H1|[H2|T]]):-
	       H=H2+1,
	       T=[H1|[H|T]].	    	