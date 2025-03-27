domains 
  el=integer
  list=el*
predicates
  p(list,integer,integer,list)
  poz(list,list)
clauses
  p([H],Y,M,L):- M=H, L=[Y],!.
  p([H|T],P,M,L):- P1=P+1, p(T,P1,M1,L1), H>M1, !, L=[P], M=H.   
  p([H|T],P,M,L):- P1=P+1, p(T,P1,M1,L1), H<M1, !, L=L1, M=M1.
  p([H|T],P,M,L):- P1=P+1, p(T,P1,M1,L1), L=[P|L1], M=M1.
  poz(L1,L2):- p(L1,1,M,L2).