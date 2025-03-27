predicates
    suma(integer,integer)
    suma(integer,integer,integer,integer)

goal
    suma(7,S),
    write("Suma este ",S),nl.
        
clauses
    suma(N,S):-suma(N,S,0,0).
    suma(N,S,N,S):-!.
    suma(N,S,I,Sum):-I1=I+1,
                     Sum1=Sum+1,
                     suma(N,S,I1,Sum1).  