/*Sa da o lista de intregi. Se cere multimea 
numerlor pare din lista.
*/
domains
	elem=integer
	lista=elem*
predicates
	multimea(lista,lista) %(i,o)
	apare(elem,lista) %(i,i)
clauses
	apare(E,[E|_]):-!.
	apare(E,[_|T]):-apare(E,T).
	multimea([],[]).
	multimea([H|T],[H|L]):-
			H mod 2=0,
			not(apare(H,T)),
			!,
			multimea(T,L).
	multimea([_|T],L):-
			multimea(T,L).