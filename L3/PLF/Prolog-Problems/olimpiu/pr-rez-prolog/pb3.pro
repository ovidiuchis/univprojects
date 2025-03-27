%Sa se scrie un predicat care determina lungimea unei liste(i,o).

domains
   el=integer
   list=el*
predicates
   lungime(list,integer)
goal
   lungime([1,2,3],L),
   write("Lungimea este ",L),nl.   
clauses
   lungime([],0).
   lungime([_|T],L):-lungime(T,L1),L=L1+1.