domains
 list=integer*
predicates
 sublista(integer,integer,list,list)
clauses
 sublista(M,N,[],[]):-!.
 sublista(M,N,[H|T],[H|L]):-M<=1,N>=1,!,M1=M-1,N1=N-1,sublista(M1,N1,T,L).
 sublista(M,N,[_|T],L):-M1=M-1,N1=N-1,sublista(M1,N1,T,L).