/*Definiti un predicat care selecteaza al n-lea
element al unei liste.*/

domains
       elem=integer
       list=elem*
predicates
          select(list,integer,elem)
clauses
        select([H|T],1,H):-!.
        select([_|T],N,S):-
           N1=N-1,
           select(T,N1,S).