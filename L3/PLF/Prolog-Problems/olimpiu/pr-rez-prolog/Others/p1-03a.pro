%Sa se intercaleze un element pe pozitia a n-a a unei liste.
domains
  el=integer
  list=el*
predicates
  inter(list,el,el,list)
clauses
  inter([],E,1,[E]):-!.
  inter([],_,_,[]).
  inter([H|T],E,1,[E|[H|T]]):-!.
  inter([H|T],E,X,[H|T1]):-X>1,X1=X-1,inter(T,E,X1,T1).
goal
  inter([1,2,3,4],0,5,X),
  write(X).