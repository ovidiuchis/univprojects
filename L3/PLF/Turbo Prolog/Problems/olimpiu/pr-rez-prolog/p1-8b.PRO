%adaug dupa fiecare numar par cifra 1
domains
   list=integer*
predicates
   even(integer)
   form(list,list)
   
clauses
  even(I):- I mod 2=0.
  
  form([],[]).
  form([H|T],[H,1|Tn]):-
       even(H),form(T,Tn).
  form([H|T],[H|Tn]):-
       not (even(H)),form(T,Tn).     

    
       
  
         