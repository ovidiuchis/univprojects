/*Sa da o lista formata din nr. intregi si simboluri.
Sa cere suma nr. intgeri pare din lista.*/

domains
	elem=i(integer);s(symbol)
	lista=elem*
predicates
	suma(lista,integer)
clauses
	suma([],0).
	suma([i(H)|T],S):-
		H mod 2=0,
		!,
		suma(T,S1),
		S=H+S1.
	suma([_|T],S):-
		suma(T,S).