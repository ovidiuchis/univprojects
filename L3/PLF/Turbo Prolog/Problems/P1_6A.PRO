/* Sa se scrie un predicat care intoarce intersectia
a doua multimi.*/

domains
        elem=integer
        lista=elem*
predicates
           member(elem,lista)
           inters(lista,lista,lista)
clauses
        member(E,[E|_]).
        member(E,[_|L]):-
          member(E,L).
        inters([],_,[]).
        inters([A|L1],L2,[A|L3]):-
          member(A,L2),
          !,
          inters(L1,L2,L3).
        inters([A|L1],L2,L3):-
          inters(L1,L2,L3). 