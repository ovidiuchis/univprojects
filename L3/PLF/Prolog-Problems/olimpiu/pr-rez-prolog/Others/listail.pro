domains
	elem = integer
	lista = elem *
	ell = e(elem);l(lista);none
	lil = ell*
predicates
	elimina(lil,lil)
	elimina1(lil,integer,lil)
clauses
	elimina(L1,L2):-
		elimina1(L1,0,L2).
	elimina1([],_,[]).
	elimina1([l(_)|[l(H)|T]],_,X):-
		elimina1([l(H)|T],1,X),
		!.
	elimina1([l(_)|T],1,X):-
		elimina1(T,0,X).
	elimina1([H|T],_,[H|X]):-
		elimina1(T,0,X).
