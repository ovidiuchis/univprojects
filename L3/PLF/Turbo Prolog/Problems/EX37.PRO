/*Se da o lista cu elem. numerice. Sa se genereze
combinari cu n elem avand o suma S data.*/

domains
	elem=integer
	list=elem*
predicates
	comb(list,elem,elem,list)
clauses
	comb([A|_],1,A,[A]).
	comb([_|T],N,S,L):-
		comb(T,N,S,L).
	comb([H|T],N,S,[H|L1]):-
		N<>1,
		N1=N-1,
		S1=S-H,
		S1>0,
		comb(T,N1,S1,L1).