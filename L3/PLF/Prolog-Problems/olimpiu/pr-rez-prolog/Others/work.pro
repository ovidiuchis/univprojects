domains
  el=integer
  list=el*
predicates
   lg(list, integer)
clauses
   lg([],0).
   lg([_|T],L):-lg(T,L1), L=L1+1. 
goal:lg([1,2,3,4],1).