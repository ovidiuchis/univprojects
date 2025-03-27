/*Sa se scrie un program care dubleaza elementele
din n in n.*/

domains
	elem=integer
	lista=elem*
predicates
	  dublare(lista,elem,lista) %(i,i,o)
	  dublare_aux(lista,elem,elem,lista) 
	  %(i,i,i,o)
clauses
	dublare(L,N,L1):-
		dublare_aux(L,N,N,L1).
	dublare_aux([],_,_,[]).
	dublare_aux([H|T],1,N,[H|[H|T1]]):-
		!,
		dublare_aux(T,N,N,T1).
	dublare_aux([H|T],M,N,[H|T1]):-
		M1=M-1,
		dublare_aux(T,M1,N,T1).