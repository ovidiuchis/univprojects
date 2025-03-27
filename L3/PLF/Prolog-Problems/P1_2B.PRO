
domains
       elem=integer
       list=elem*
       listd=list*
predicates
          pereche(list,list)
          perechi(elem,list,list)
          toate(list,listd)
clauses
        perechi(E,[H|_],[E,H]).
        perechi(E,[H|T],P):-
          perechi(E,T,P).
        pereche([H|T],P):-
          perechi(H,T,P).
        pereche([_|T],P):-
          pereche(T,P).
        toate(L,P):-
          findall(X,pereche(L,X),P).
       