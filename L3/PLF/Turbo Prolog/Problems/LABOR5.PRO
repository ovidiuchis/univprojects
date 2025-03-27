
domains
        lista=integer*
predicates
          subm(lista,integer,lista)
clauses
        subm([H|L],1,[H]).
        subm([_|T],N,L):-
                          subm(T,N,L).
        subm([H|T],N,[H|L]):-
                   N<>1,
                   N1=N-1,
                   subm(T,N1,L). 