/*Sa se scrie un predicat care avand o lista
numerica produce ca rezultat lista initiala cu
elemtele din N in N eliminate.*/

domains
	elem=integer
	list=elem*
predicates
	eliminare(list,elem,list)
	stergere(list,elem,elem,list)
clauses
	eliminare(L,N,L1):-
		stergere(L,N,N,L1).
	stergere([],_,_,[]).
	stergere([_|T],1,N,L1):-
		!,
		stergere(T,N,N,L1).
	stergere([H|T],M,N,[H|T1]):-
		M1=M-1,
		stergere(T,M1,M,T1).