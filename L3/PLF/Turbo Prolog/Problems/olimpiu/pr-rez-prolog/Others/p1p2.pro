domains
   el=integer
   list=el*
predicates
   reun(list,list,list) 
   member(el,list)
clauses
   member(E,[E|_]).
   member(E,[_|T]):- member(E,T).
   reun([],L,L).
   %reun(L,[],L).
   reun([H|T],L,[H|T1]):- not (member(H,L)), !, reun(T,L,T1).
   reun([_|T],L,T1):- reun(T,L,T1).
goal
  reun([1,2,3],[3,5,4,1],L),
  write(L).  
   