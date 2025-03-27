%sortez lista eliminand valorile care se repeta

domains
   list=integer*
predicates
   insert(integer,list,list)
   sort(list,list,list)
   insertsort(list,list)
   member(integer,list)
   elimin(list,list)
clauses
   member(E,[E|_]).
   member(E,[_|T]):- member(E,T).

   insertsort(List1,Sorted):-
           elimin(List1,List),!,
           sort(List,[],Sorted).
   
   sort([],Acc,Acc).
   sort([H|T],Acc,Sorted):-
           insert(H,Acc,Nacc),sort(T,Nacc,Sorted).
   insert(X,[Y|T],[Y|NT]):-
           X>Y,insert(X,T,NT).
   insert(X,[Y|T],[X,Y|T]):-
           X<=Y.
   insert(X,[],[X]).                             
  
   elimin([],[]).
   elimin([H|T],Tnou):- 
         member(H,T),elimin(T,Tnou).
   elimin([H|T],[H|Tnou]):- 
         not(member(H,T)),elimin(T,Tnou).