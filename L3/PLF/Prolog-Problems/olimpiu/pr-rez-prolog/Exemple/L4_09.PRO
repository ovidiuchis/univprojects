/* Definiti un predicat care det. succesorul unui
   numar reprezentat cifra cu cifra intr-o lista.
   De exemplu:[1 9 3 5 9 9] -> [1 9 3 6 0 0].    */
domains
  list=integer*
predicates
  succ(list, list)
  succ0(list,list)
  inv(list,list)
  conc(list,list,list)
clauses
  conc([],L,L).
  conc([X|L1],L2,[X|L3]):-
                          conc(L1,L2,L3). 
  inv([],[]).
  inv([X|H],L):-
     inv(H,S),
     conc(S,[X],L).

  succ(A, B) :-
    inv(A, A1),
    succ0(A1, B1),
    inv(B1, B).
  succ0([], [1]) :- !.
  succ0([A|L1], L2) :-
    A < 9,
    !,
    A1 = A+1,
    L2 = [A1|L1].
  succ0([_|L1], L2) :-
    succ0(L1, LL),
    L2 = [0|LL].
  
  
 