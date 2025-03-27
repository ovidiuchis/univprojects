%Sa se determine suma nr.pare din intervalul [A,B] 

predicates 
    suma(integer,integer,integer)
goal
    suma(2,8,S),
    write("Suma este ",S),nl.
clauses
    suma(A,B,0):-A>B,!.   
    suma(A,B,S):-A mod 2=0,!,A1=A+1,suma(A1,B,S1),S=A+S1.
    suma(A,B,S):-A1=A+1,suma(A1,B,S).
    
    