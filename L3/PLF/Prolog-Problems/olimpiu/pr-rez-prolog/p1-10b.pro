%Sa se scrie un predicat care elimina primele 3 aparitii 
%ale unui element intr-o lista.Daca elementul apare 
%mai putin de 3 ori, se va elimina de cate ori apare.

domains
   list=integer*
   
predicates
   elimin(integer,list)
   tip(list)
   run(integer,list)
clauses
   tip([]):-nl.
   tip([H|T]):-write(H,"  "),tip(T),!.      
   elimin(E,[]):-!.
   elimin(E,[H|T]):-E=H,L=T,elimin(E,L).
   elimin(E,[_|T]):-elimin(E,T),!.
   
   
   run(E,L):-elimin(E,L),tip(L).