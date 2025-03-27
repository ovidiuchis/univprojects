% Se da o lista formata din numere intregi. Sa se
% insereze un element la jumatatea listei (pe pozitia 
% lungimea div 2+1) 
domains
  el=integer
  lista=el*
predicates
  length(lista,integer)
  inserez(el,lista,lista) % predicatul de baza -primul arg. el ce se insereaza
  			  % al doilea arg. lista in care se face inserarea
  			  % al treilea argument rezultatul
  ins(el,integer,lista,lista) % predicat auxiliar - al doilea arg. pozitia
clauses 
  length([],0).
  length([_|L],N):-length(L,M),N=M+1.
  inserez(A,[],[A]):-!.
  inserez(A,L,L1):-length(L,M),N=M div 2,ins(A,N,L,L1).
  ins(A,0,L,[A|L]):-!.
  ins(A,N,[B|L],[B|L1]):-N1=N-1,ins(A,N1,L,L1).
  
 % apel la executie 
 %  goal:inserez(2,[1,3,4,5],L) => L=[1,3,2,4,5]
 %  goal:inserez(2,[1,3,4,5,6],L) => L=[1,3,2,4,5,6]