/*Sa se concateneze doua liste.*/

domains
	elem=integer
	list=elem*
predicates
	append(list,list,list) %(i,i,o)
clauses
	append([],L,L).
	append([H|T],L,[H|T1]):-
		append(T,L,T1).