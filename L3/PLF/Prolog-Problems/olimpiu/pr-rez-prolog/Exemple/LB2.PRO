/* P1 - Liste in Prolog */

/*12.a) Sa se scrie un predicat care substituie 
        intr-o lista un element printr-o alta lista.
*/

domains
  elem=symbol
  list=symbol*
  listd=list*

predicates
  sb(elem,list,list,listd)
  % substituie elem(1) cu list(2) in list(3),rezultat
  % list(4)

clauses
 sb(elem,[_|_],[],[]).
  % intoarce [] daca vrem sa subst. in []
% sb(elem,[],L,L1):- L1=L.
 sb(elem,L,[elem|T],L1):- sb(elem,L,T,[L|L1]).
 sb(elem,L,[H|T],L1):- R=[H|T],sb(elem,L,T,L1).
  
  

