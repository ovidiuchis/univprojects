%Dandu-se o valoare N, se cere sa se genereze permutarile de N elemente  
%cu proprietatea ca oricare ar fi 2<=i<=n exista un 1<=j<=i astfel incat |v(i)-v(j)|=1.
domains
  el=integer
  list=el*
  listdouble=list*
predicates
  listapermutari(list,listdouble)
  nondeterm permutari(list,list)
  conditie(list)
  apartine(list,list)
  nondeterm elapartine(list,list)
  nrapar(list,el)
  length(list,el)
clauses
  length([],0):-!.
  length([_|T],L):-length(T,L1),L=L1+1.
  nrapar([H|_],X):-H=X,!.
  nrapar([_|T],X):-nrapar(T,X).
  elapartine(L,L1):-apartine(L,L1),length(L1,K),length(L,J),K=J,!.
  apartine(_,[]):-!.
  apartine(L,[H1|T1]):-nrapar(L,H1),apartine(L,T1).
  conditie([H|T]).
  permutari(L,L1):-apartine(L,L1),conditie(L1).
  listapermutari(L,L1):- findall(X,permutari(L,X),L1).
goal
  apartine([7,2,4],Y).
  length([1,2,3],E).
%  permutari([7,2,4],X).
%  listapermutari([7,3,4],X),
%  write(X),nl.