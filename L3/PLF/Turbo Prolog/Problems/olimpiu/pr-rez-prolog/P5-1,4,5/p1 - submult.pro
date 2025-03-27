%Sa se genereze lista submultimilor cu N elemente, cu elementele unei liste date.
%Ex: [2,3,4] N=2 => [[2,3],[2,4],[3,4]]
domains
  el=integer
  list=el*
  listdouble=list*
predicates
  listasubmultimi(list,el,listdouble)
  nondeterm submultimi(list,el,list)
  nondeterm apartine(list,list)
  length(list,el)
clauses
  length([],0):-!.
  length([_|T],L):-length(T,L1),L=L1+1.
  apartine(_,[]).
  apartine([H|T],[H1|T1]):-H=H1,apartine(T,T1).
  apartine([_|T],[H1|T1]):-apartine(T,[H1|T1]).
  submultimi(L,N,L1):-apartine(L,L1),length(L1,N).
  listasubmultimi(L,N,L1):- findall(X,submultimi(L,N,X),L1).
goal:
  listasubmultimi([7,2,3],2,X).