%diferenta a doua multimi

domains
  list = integer*
predicates
  member(integer,list)
  diff(list,list,list)

clauses 
  member(E,[E|_]).
  member(E,[_|T]) :-  member(E,T).     
  
  
  diff([],List,[]).
  diff([H|Tail],List,Tnou) :-
      member(H,List),
      !,
      diff(Tail,List,Tnou).
  diff([H|Tail],List,[H|Tnou]):-    
      diff(Tail,List,Tnou) .
     
  

     