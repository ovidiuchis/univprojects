/*Definiti un predicat care determina predecesorul
unui numar reprezentat cifra cu cifra intr-o lista.*/

domains
       elem=integer
       list=elem*
predicates
          inv(list,list)
          conc(list,list,list)
          pred(list,list)
          predecesor(list,list)
clauses
       conc([],L,L).
       conc([A|L1],L2,[A|L3]):-
          conc(L1,L2,L3).
       inv([],[]).
       inv([A|L1],L2):-
         inv(L1,L3),
         conc(L3,[A],L2).
       predecesor(A,B):-
         inv(A,A1),
         pred(A1,B1),
         inv(B1,B).
       pred([1],[]):-!.
       pred([A|L1],L2):-
         A>0,
         !,
         A1=A-1,
         L2=[A1|L1].
       pred([_|L1],L2):-
         pred(L1,LL),
         L2=[9|LL].