domains
   el=integer
   list=el*
   ld=list*
predicates
   /*este(el,list)*/

   perechi(list,list)
   perechib(el,list,list)
   toate(list,ld)
   
clauses
   /*este(E,[H|T]):- E=H.
   
    este(E,[_|T]):- este(E,T).*/
     

   perechib(E,[H|_],[E,H]).
   perechib(E,[_|T],P):- perechib(E,T,P).
   perechi([H|T],P):- perechib(H,T,P).
   perechi([_|T],P):- perechi(T,P).
   toate(L,P):- findall(X,perechi(L,X),P).     