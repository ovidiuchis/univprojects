domains
   lista=integer*
predicates
   cmmdc2(integer,integer,integer)
   cmmdc(lista,integer)
clauses
   cmmdc2(0,N,N):-!.
   cmmdc2(N,0,N):-!.
   cmmdc2(N,N,N):-!.
   cmmdc2(N,M,R):-N>M,N1=N-M,cmmdc2(N1,M,R).
   cmmdc2(N,M,R):-M>N,M1=M-N,cmmdc2(N,M1,R).
   
   cmmdc([],0):-!.
   cmmdc([H|[]],H):-!.
   cmmdc([H|T],R):-cmmdc(T,D),cmmdc2(D,H,R).     
   