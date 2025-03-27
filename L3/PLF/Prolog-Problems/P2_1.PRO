/*Definiti un predicat care determina succesorul
uni numar reprezentat cifra cu cifra intr-o lista.
*/

domains
        elem=integer
        list=elem*
predicates
           succ(list,list)
           succ0(list,list)
           inv(list,list)
           conc(list,list,list)
clauses
        conc([],L,L).
        conc([A|L1],L2,[A|L3]):-
          conc(L1,L2,L3).
        inv([],[]).
        inv([A|L],L1):-
          inv(L,L2),
          conc(L2,[A],L1).
        succ(A,B):-
          inv(A,A1),
          succ0(A1,B1),
          inv(B1,B).
       succ0([],[]):-!.
       succ0([A|L1],L2):-
         A<9,
         !,
         A1=A+1,
         L2=[A1|L1].
       succ0([_|L1],L2):-
         succ0(L1,LL),
         L2=[0|LL].