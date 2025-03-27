domains
  el=integer
  lista=el*
  
predicates

  ada(lista,el,el,el,lista)
  aux(lista, el, el, el, lista)
  adg(lista,el,lista)
  
clauses

  aux([H|T],X,N,M,L1):- N1=N+1, ada(T,X,N1,M,L1).
 
  ada([],_,_,_,[]):-!.
 
  ada([H|T],X,N,M,L):- N=M,!, MO=2*M+1, 
                             aux([H|T],X,N,MO,L1),
                             L=[H|[X|L1]],!.
  ada([H|T],X,N,M,L) :- aux([H|T],X,N,M,L1),
                        L=[H|L1].
                                                                 
  adg(L,X,L1):-ada(L,X,1,1,L1).
  
