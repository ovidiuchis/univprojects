/* P3 Problema 10: 
   Sa se construiasca un predicat care verifica
   daca un arbore binar este echilibrat.
   
   Un arbore este echilibrat <=> 
      | depth(arb_stang)-depth(arb_drept) | <=1 
   
    */
domains
  element=integer
  arbore=arb(element,arbore,arbore);nil
  
predicates
  depth(arbore,integer)
  echilibrat(arbore)
  
clauses
  depth(nil,0).
  depth(arb(_,S,D),N):-depth(S,N1),depth(D,N2),
  		       N1>=N2,N=N1+1.
  depth(arb(_,S,D),N):-depth(S,N1),depth(D,N2),N1<N2,
		       N=N2+1.
  echilibrat(arb(_,nil,nil)).
  echilibrat(arb(_,S,D)):-depth(S,N1),depth(D,N2),
                       N1=N2.
  echilibrat(arb(_,S,D)):-depth(S,N1),depth(D,N2),
   		       N=N1,N=N2+1.
  echilibrat(arb(_,S,D)):-depth(S,N1),depth(D,N2),
  		       N=N1,N=N2-1.   		     	                          		       