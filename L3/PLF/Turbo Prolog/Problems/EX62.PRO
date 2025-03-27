/*P2.14.Pozitile elemtului minim dintr-o lista.*/

domains
	elem=integer
	list=elem*
predicates
	minim(list,elem)
	pozminim(elem,list,elem)
	run(list,list)
clauses
	minim([],32000).
	minim([H|T],M):-
		minim(T,M),
		M<H,
		!.
	minim([H|_],H).
	pozminim(E,[E|_],1).
	pozminim(E,[H|T],N):-
		E=H,
		pozminim(E,T,N1),
		N=N1+1.
	pozminim(E,[H|T],N):-
		E<>H,
		pozminim(E,T,N1),
		N=N1+1.
	run(L,P):-
		minim(L,Min),
		findall(Poz,pozminim(Min,L,Poz),P).