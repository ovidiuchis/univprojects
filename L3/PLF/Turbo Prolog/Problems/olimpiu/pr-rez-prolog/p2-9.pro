%Sa se interclaseze cu pastrarea dublurilor doua liste
%sortate.
domains
   list=integer*
   
predicates
   tip(list)
   inter(list,list,list)
   
goal
   inter([1,2,3],[],L),
   tip(L),nl.
   

clauses
   tip([]):-nl.
   tip([H|T]):-write(H,"  "),tip(T),!.
   
   inter([],L,L).
   inter([H|T],[H1|T1],[E|R]):-H<=H1,inter(T,[H1|T1],[H|R]).
   inter([H|T],[H1|T1],[E|R]):-inter([H|T],T1,[E|R]).
   