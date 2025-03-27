domains
    el=integer
    list=el*
predicates
    introdu(list,integer,integer,list,integer)
    adauga(list,integer,list)
clauses
    adauga(L1,E,L2):-introdu(L1,1,E,L2,1).
    introdu([H|T],N,E,[H|L],I):-N<>1,!,M=N*2+1;N1=N-1,introdu(T,N1,E,L,I).      
    introdu([H|T],N,E,[H|[E|L]],I):-N=1,!,N1=N-1,introdu(T,N1,E,L,I).    
   % introdu([],_,_,_,I):-I<40,I1=I*2,introdu(_,_,_,_,I1).
 