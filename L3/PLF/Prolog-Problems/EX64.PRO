/*P2.15.Sa se elimine toate secventele de valori
cunsecutive.*/

domains
	elem=integer
	list=elem*
predicates
	elimina(list,list)
clauses
	elimina([],[]).
	elimina([E],[E]).
	elimina([E1|[E2|[E3|T]]],T):-
		E2=E1+1,
		E3=E2+1,
	%	!,
		elimina([E2|[E3|T]],T).
	elimina([E1|[E2|T]],[E1|[E2|T1]]):-
		E2<>E1+1,
	%	!,
		elimina(T,T1).
	elimina([E1|[E2|[E3|T]]],T1):-
		E1=E2+1,
		E3<>E2+1,
		elimina([E3|T],T1).