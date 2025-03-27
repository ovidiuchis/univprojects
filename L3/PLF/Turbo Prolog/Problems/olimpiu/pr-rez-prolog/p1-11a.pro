%Sa se scrie un predicat care testeaza daca o lista 
%este multime.
domains
   list=integer*
   
predicates
   member(integer,list)
   multime(list)

clauses
   member(E,[E|T]):-!.
   member(E,[_|T]):-member(E,T).
   multime([H|T1]):-member(H,T1),write("Lista nu e multime"),nl.
   multime([H|T1]):-write("Lista e multime"),nl.
