/*Sa se scrie un predicat care elimina dintr-o
lista toate elementele care se repeta.
Ex.l=[1,2,1,4,1,3,4]=> l=[2,3].
*/

domains
       elem=integer
       list=elem*
predicates
          elimina(elem,list,list)
           run(list,list)
          apare(elem,list)
          tip(list)
clauses
        tip([]).
        tip([H|T]):-
          write(H),
          write(" "),
          tip(T).
        apare(E,[E|_]).
        apare(E,[_|T]):-
          apare(E,T).
        elimina(_,[],[]).
        elimina(E,[E|T1],T2):-
          elimina(E,T1,T2).
        elimina(E,[H|T1],[H|T2]):-
          E<>H,
          elimina(E,T1,T2).
       run([H|L1],L2):-
         apare(H,L1),
         elimina(H,L1,Lnou),
         tip(Lnou),
         nl,
         run(LNou,L2).