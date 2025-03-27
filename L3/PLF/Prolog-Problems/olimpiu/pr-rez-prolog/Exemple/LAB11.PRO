/* Definiti  predicatele de egalitate si mai mic 
   pentru numere scrise in reprezentare de liste.*/
domains
  list=integer*
predicates
  egal(list,list)
  maimic0(list,list)
  maimic(list,list)
clauses
  egal([],[]):-!.
  egal([X|L1],[X|L2]):-
    egal(L1,L2).
  maimic0([],L):-
    !,
    L<>[].
  maimic([X|L1],[Y,L2]):-
    egal(L1,L2),
    !,
    X<Y.
  maimic0([X|L1],[Y|L2]):-
    maimic(L1,L2).
  maimic(A,B):-
    inv(A,A1),
    inv(B,B1),
    maimic0(A1,B1). 