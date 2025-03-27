domains
   el=integer
   list=el*
   ld=list*
predicates
   perechi(list,list)
   perechid(el,list,list)
   toate(list,ld)
   
clauses    

   perechid(E,[H|_],[E,H]).
   perechid(E,[_|T],P):- perechid(E,T,P).
   perechid([H|T],P):- perechid(H,T,P).
   perechi([_|T],P):- perechi(T,P).
   toate(L,P):- findall(X,perechi(L,X),P).     