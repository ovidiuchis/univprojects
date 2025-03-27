/*Sa se genereze submultimile unei multimi.*/

domains
	elem=integer
	list=elem*
	listd=list*
predicates
          subm(list,list)
          toate(list,listd)
clauses
	subm([],[]).
	subm([_|T],L):-
		subm(T,L).
	subm([H|T],[H|L]):-
		subm(T,L).
	toate(L,Ld):-findall(X,subm(L,X),Ld).