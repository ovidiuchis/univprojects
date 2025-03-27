/*Definiti un predicate care intoarce cel mai mare
divizor comum al numerelor dintr-o lista.*/

domains
        elem=integer
        list=elem*
predicates
          cmmdc(elem,elem,elem)
          cmmdc2(list,elem)
clauses
        cmmdc(A,B,A):-
          A=B,
          !.
        cmmdc(A,0,A):-!.
        cmmdc(0,B,B):-!.
        cmmdc(A,B,Rez):-
          A>B,
          Y=A-B,
          cmmdc(Y,B,Rez).
        cmmdc(A,B,Rez):-
          A<B,
          Y=B-A,
          cmmdc(A,Y,Rez).
        cmmdc2([],0).
        cmmdc2([H|T],Rez):-
           cmmdc2(T,X1),
           cmmdc(X1,H,Rez).