predicates
  ancestor(symbol,symbol).
  parent(symbol,symbol).
clauses
  ancestor(X,X).
  ancestor(X,Y):-ancestor(Z,Y),parent(X,Z).
  parent(a,b).