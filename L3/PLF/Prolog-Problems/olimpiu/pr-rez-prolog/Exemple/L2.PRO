%  ex:[193600]->[193599]
domains
  list=integer*  
                            
predicates
  predecesor(list,list)
  pred(list,list)
  inv(list,list)
  conc(list,list,list)
clauses
  conc([],L,L):-!.
  conc([X|L1],L2,[X|L3]):-conc(L1,L2,L3).
  inv([],[]):-!.
  inv([X|H],L):- inv(H,S), conc(S,[X],L).
  predecesor(A,B):-inv(A,A1), pred(A1,B1),inv(B1,B).
  pred([1],[]):-!.
  pred([A|L1],L2):- A>0,!,A1=A-1, L2=[A1|L1].
  pred([_|L1],L2):- pred(L1,LL),L2=[9|LL].
 
 
