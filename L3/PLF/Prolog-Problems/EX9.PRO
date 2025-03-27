/*Sa se scrie un program care dubleaza elem. unei
liste din n in n.*/

domains
	elem=integer
	lista=elem*
predicates
	  dublare(lista,elem,lista)
	  dublare_aux(lista,elem,elem,lista)
clauses
	dublare(L,N,L1):-
		dublare_aux(L,N,N,L1).
	dublare_aux([],_,_,[]).
	dublare_aux([H|T],1,N,[H|[H|L]]):-
			!,
			dublare_aux(T,N,N,L).
	dublare_aux([H|T],M,N,[H|L]):-
			M1=M-1,
			dublare_aux(T,M1,N,L).