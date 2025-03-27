%sa se sorteze o lista cu pastrarea dublurilor
domains
    el=integer
    list=el*
predicates
    sortare(list,list)
    minim(list,integer)
    stergere(list,integer,list)
    apare(integer,list,integer)
clauses
    minim([],32000).
    minim([H|T],M):-minim(T,M),M<H,!.
    minim([H|_],H).
    apare(_,[],0):-!.
    apare(H,[H|T],N1):-apare(H,T,N),N1=N+1,!.
    apare(H,[_|T],N):-apare(H,T,N).
    stergere([],_,[]).
    stergere([E|T],E,T1):-!,stergere(T,E,T1).
    stergere([H|T],E,[H|T1]):-stergere(T,E,T1).
    sortare([],[]).
    sortare([H|T],L2):-minim([H|T],M),
                 apare(M,[H|T],N),N>1,!,
                 stergere([H|T],M,T1),
                 sortare(T1,L3),L2=[M|[M|L3]].
    sortare([_|T],L2):-minim([_|T],M),
                   stergere([_|T],M,T1),
                   sortare(T1,L3),
                   L2=[M|L3].
   
    
        