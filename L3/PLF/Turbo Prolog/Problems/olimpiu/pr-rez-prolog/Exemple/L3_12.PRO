/* Problema 5.a din P1:
Predicatul e satisfacut daca o lista are numar par 
de elemente si va esua in caz contrar,fara sa se 
numere elementele listei.	*/

domains
  list=integer*

predicates
  par(list)

clauses
  par([]).
  par([_|[_|E]]):-par(E).
