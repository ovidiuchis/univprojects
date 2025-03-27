domains
  list=integer*
  mul=integer*
predicates
  listmul(list,mul)
  printset(mul)
  membru(integer,list)
clauses
  printset([]).
  printset([H|T]):-write(H),write(" "),printset(T).
  
  membru(E,[E|_]).
  membru(E,[_|T]):-membru(E,T).
  
  listmul([],[]).
  listmul([E|T1],[E|T2]):-listmul(T1,T2),
   		          not(membru(E,T1)).
  listmul([E|T1],T2):-listmul(T1,T2),membru(E,T1).
  
goal
	listmul([1,2,3,4,1,23,3],X),
	printset(X).
	    
    