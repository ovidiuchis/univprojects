domains
 el=integer
 elem=symbol
 arbore=arb(elem,arbore,arbore);nil
 lista=el*
 
predicates

 nivel(arbore,el,el,el,el)
 adaugsf(el,lista,lista)
 niv(arbore,lista,lista,el)
 nivtot(arbore,lista)
clauses

 adaugsf(E,[],[E]):-!.
 adaugsf(E,[H|T],L):- adaugsf(E,T,L1), L=[H|L1].

 nivel(nil,_,_,_,0).
 nivel(arb(R,S,D),M,M,X,X1):-X1=X+1,!.
 nivel(arb(R,S,D),N,M,X,X1):-N1=N+1,
                             nivel(S,N1,M,0,X3),
                             nivel(D,N1,M,0,X4),
                             X1=X3+X4.

 niv(A,L,L1,N):-nivel(A,1,N,0,X), 
                X=0, !,L1=L.
 niv(A,L,L1,N):-nivel(A,1,N,0,X),                  
                adaugsf(X,L,L2),N1=N+1,
                niv(A,L2,L1,N1).                              

 nivtot(A,L):- niv(A,[],L,1).                             
                                       