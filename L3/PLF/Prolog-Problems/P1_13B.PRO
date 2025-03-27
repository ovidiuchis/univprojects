/*Sa se elimine elmentul de pe pozitia a n-a
a unei liste.*/

domains
        elem=integer
        list=elem*
predicates
         elimina(integer,list,list)
clauses
       elimina(0,L,L).
       elimina(1,[H|T],T).
       elimina(N,[H|T1],[H|T2]):-
         elimina(M,T1,T2),
         N=M+1,
         M>0.