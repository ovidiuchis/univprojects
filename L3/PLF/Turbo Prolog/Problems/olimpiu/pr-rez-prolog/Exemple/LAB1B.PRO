domains
 lista=integer*
predicates
 cmmdc1(integer,integer,integer)
 cmmdc(lista,integer)
clauses
 cmmdc1(0,X,X).
 cmmdc1(X,0,X).
 cmmdc1(X,X,X).
 cmmdc1(X,Y,Z):-X<Y,
                Y1=Y-X,
                cmmdc1(X,Y1,Z).
 cmmdc1(X,Y,Z):-X>Y,
                X1=X-Y,
                cmmdc1(X1,Y,Z).             
 cmmdc([],0).
 cmmdc([H|T],X):-cmmdc(T,Y),
                 cmmdc1(H,Y,X),
                 !.



                 
                 