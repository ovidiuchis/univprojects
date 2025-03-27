/* P2 Liste in Prolog (2)
8.  Sa se sorteze o lista cu eliminarea dublurilor.
     Exemplu: [4 2 6 2 3 4] --> [2 3 4 6]
					*/
 
 domains
   lista = integer*
   
predicates

   afiseaza(lista)
   sort(lista,lista)
   inserare(integer,lista,lista)
 
clauses

   afiseaza([]).
   afiseaza([H|T]):-write(H),write(" "),afiseaza(T).
   
   inserare(X,[],[X]). /*elem. X in lista vida */
   inserare(X,[Y|L],[X,Y|L]):-X<Y,!. 
   inserare(X,[Y|L1],[Y|L2]):-X>Y,inserare(X,L1,L2).            
   inserare(X,[X|L],[X|L])./*fara pastrarea dbl.*/

   sort([],[]).
   sort([X|L1],L2):-sort(L1,L3),inserare(X,L3,L2).
    
goal
   afiseaza([10,1,2,3,21,1,2,3,4]),nl,
   sort([10,1,2,3,21,1,2,3,4],L),afiseaza(L),nl.   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
