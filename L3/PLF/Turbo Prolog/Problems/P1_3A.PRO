/*Sa se intercaleze un element pe pozitia a 
n-a unei liste.*/

domains
        elem=integer
        list=elem*
predicates
          interc(list,elem,elem,list)
clauses
       interc([],E,1,[E]):-!.
       interc([],_,_,[]).
       interc([H|T],E,1,[E|[H|T]]):-!.
       interc([H|T],E,X,[H|T1]):-
         X>0,
         X1=X-1,
         interc(T,E,X1,T1).