/*Sa se determine pozitiile elementului minim
dintr-o lista liniara.*/

domains
        elem=integer
        list=elem*
predicates
          minim(list,elem)
          minimPoz(elem,list,elem)
          run(list,list)
clauses
         minim([E],E).
         minim([E|T],E):-
            minim(T,M),
            E<=M.
         minim([E|T],M):-
          minim(T,M),
          E>M.
         minimPoz(E,[E|_],1).
         minimPoz(M,[H|T],Poz):-
            M<>H,
            minimPoz(M,T,P1),
            Poz=P1+1.
        minimPoz(M,[H|T],Poz):-
          M=H,
          minimPoz(M,T,P1),
          Poz=P1+1.
        run(L,P):-
          minim(L,Min),
          findall(Poz,minimPoz(Min,L,Poz),P).