/* Sa se scrie un predicat care sa fie adevarat
daca o lista numerica reprezinta o multime.*/

domains
	elem=integer
	list=elem*
predicates
	apare(elem,list)
	multime(list)
clauses
	apare(E,[E|_]).
	apare(E,[_|T]):-
		apare(E,T).
	multime([]).
	multime([H|T]):-
		not(apare(H,T)),
		multime(T).