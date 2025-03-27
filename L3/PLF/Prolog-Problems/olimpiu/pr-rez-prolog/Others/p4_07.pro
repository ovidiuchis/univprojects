domains
	el = integer
	lista = el*
	element=i(integer);l(lista)
	listad = element*
predicates
	s(lista,integer)
	suma(listad,integer,integer)
clauses
	s([],0).
	s([A|L],S):-
		A mod 2 = 0,
		!,
		s(L,S1),
		S = A + S1.
	s([_|L],S):-
		s(L,S),
		!.	
	suma([],0,_).
	suma([l(L)|L1],Su,N):-
	        N>0,
		!,		
		s(L,S),
		N1 = N - 1,
		suma(L1,SS,N1),
		Su = SS + S.			
	suma([_|L],S,N):-suma(L,S,N).	