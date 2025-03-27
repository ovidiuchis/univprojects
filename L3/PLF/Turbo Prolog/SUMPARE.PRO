domains
	el=integer
	list=el*
predicates 
	par(el)
	sum(list,el)
clauses
	par(E):-
		E mod 2=0.	
	sum([],0).
	sum([H|L],S):-
		par(H),!,
		sum(L,S1),
		S=S1+H.
	sum([_|L],S):-
		sum(L,S).