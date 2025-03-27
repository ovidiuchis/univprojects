%Sa se scrie un predicat care se va satisface daca o lista are numar 
%par de elemente si va esua in caz contrar, fara sa se numere elementele 
%listei.
domains
  el=integer
  list=el*
predicates
  nrpar(list)
clauses
  nrpar([]).
  nrpar([_|[_|T]]):-nrpar(T).
%goal:
%  nrpar([1,2,3,4,5]).