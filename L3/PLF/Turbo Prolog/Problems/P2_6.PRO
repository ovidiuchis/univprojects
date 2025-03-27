/*Definiti predicatele de egalitate si mai mic
pentru numere scrise in reprezentate pe liste.*/

domains
        elem=integer
        list=elem*
predicates
         egal(list,list)
         maimic(list,list)
         maimicegal(list,list)
clauses
       egal([],[]).
       egal([A|L1],[B|L2]):-
         A=B,
         !,
         egal(L1,L2).
      maimicegal([],_).
      maimicegal([A|L1],[B|L2]):-
        A<=B,
        !,
        maimicegal(L1,L2).
     maimic([A|L1],[B|L2]):-
       not(egal(L1,L2)),
       maimicegal(L1,L2).