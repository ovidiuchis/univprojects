
domains
   el=symbol
   lista=el*
predicates
   elimin(lista,integer,integer,lista)
   eli(lista,integer,lista)
clauses
   elimin([],_,_,[]):-!.
   elimin([H|T],N,N,L):-L=T,!.
   elimin([H|T],I,N,L):-I1=I+1, elimin(T,I1,N,L1), L=[H|L1].      
   eli(L,N,L1):-elimin(L,1,N,L1).