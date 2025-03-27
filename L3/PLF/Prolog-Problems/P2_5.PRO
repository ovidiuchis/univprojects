/*Definiti un predicat care determina valoarea
unui polinom intr-un punct.*/

domains
       elem=integer
       list=elem*
predicates
          pow(elem,elem,elem)
          length(list,elem)
          valoare(elem,list,elem)
clauses
       pow(_,0,1):-!.
       pow(X,1,X):-!.
       pow(X,R,P):-
          R=R-1,
          pow(X,R1,P1),
          P=P1*X.
        length([],0):-!.
        length([_|T],R):-
          length(T,R1),
          R=R1+1.
        valoare(_,[],0):-!.
        valoare(E,[H|T],Rez):-
          valoare(E,T,R1),
          length(T,P),
          pow(E,P,V),
          Rez=E*V+R1.  
   