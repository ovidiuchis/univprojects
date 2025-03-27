domains
    el=integer
    list=el*
predicates
    neconsecutive(list,list)
clauses
  neconsecutive([],[]):-!.
  neconsecutive([H1,H2,H3|T],L):-H2=H1+1,H3=H2+1,neconsecutive(T,L),!.
  neconsecutive([H,H1|T],L):-H1=H+1,!,
                               neconsecutive(T,L),!.
  neconsecutive([H,H1|T],L):-neconsecutive([H1|T],L1),
                               L=[H|L1],!.
                             
  neconsecutive([H1,H2],[]):-H2=H1+1,neconsecutive([],[]),!.                             
  neconsecutive([H],[H]):-!.
                      
                               
                               