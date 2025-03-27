domains
   el=integer
   list=el*
   ld=list*
predicates
   este(el,list)

   perechi(list,list)
   perechi(el,list,list)
   toate(list,ld)
   
clauses
   este(E,[H|T]):- E=H.
   este(E,[_|T]):- este(E,T).
     

   perechi(E,[H|_],[E,H]).
   perechi(E,[_|T],P):- perechi(E,T,P).
   perechi([H|T],P):- perechi(H,T,P).
   perechi([_|T],P):- perechi(T,P).
   toate(L,P):- findall(X,perechi(L,X),P).     