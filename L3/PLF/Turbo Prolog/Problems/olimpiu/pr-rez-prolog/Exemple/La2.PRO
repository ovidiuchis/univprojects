/* P1  - Liste in Prolog 
Problema 12.
b) Sa se elimine elementul de pe 
   pozitia a n-a a unei liste liniare.*/

domains
  list=symbol*
predicates
  sterge(integer,list,list)
clauses
  sterge(0,[],L):- sterge(N,[],L), N>1.
  sterge(1,[_|H],H).
  sterge(N,[X|L1],[X|L2]):- sterge(M,L1,L2), N=M+1,
                            M>0.
