/*Sa se scrie un predicate care sterge toate
aparitiile unui anumit atom dintr-o lista.*/

domains
       elem=integer
       lista=elem*
predicates
          sterge(elem,lista,lista)
clauses
        sterge(_,[],[]).
        sterge(E,[E|T],L1):-
          !,
          sterge(E,T,L1).
       sterge(E,[H|T],[H|T1]):-
         sterge(E,T,T1).