/*Sa se scrie un predicat care testeaza daca o lista
este multime*/

domains
        elem=integer
        list=elem*
predicates
          member(elem,list)
          multime(list)
clauses
        member(E,[E|_]).
        member(E,[_|T]):-
          member(E,T).
        multime([H|T]):-
          not(member(H,T)),
          multime(T).
        multime([H|T]):-
          member(H,T),
          fail.
     
          