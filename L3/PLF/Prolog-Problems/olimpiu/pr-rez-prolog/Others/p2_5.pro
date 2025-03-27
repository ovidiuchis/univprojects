domains 
  el=integer
  list=el*
predicates
  polin(list,el,el,el)
  polinom(list,el,el)
clauses
  polin([H],X,S1,S2):- S2=S1*X+H,!.
  polin([H|T],X,S1,S2):- S3=S1*X+H,polin(T,X,S3,S2).   
  polinom(L,X,S):-polin(L,X,0,S).