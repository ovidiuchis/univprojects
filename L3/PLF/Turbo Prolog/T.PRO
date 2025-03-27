domains 
	el=integer
	lista=el*
predicates
	suma(lista,el)
clauses
	suma([],0):-!.
	suma([A|L],S):-A mod 2=0, suma(L,S1),S=A+S1,!.
	suma([_|L},S):-suma(L,S).
	