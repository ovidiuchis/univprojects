 %Sa se elimine dint-o lista cate un elememnt.Sa se  
%det toate posibilitatile
domains
	el=integer
	list=el*
predicates
	elim(list,list)
   	
clauses
	elim([],[]).
	elim([_|T],L):-elim(T,L).
	elim([H|T],[H|T1]):-elim(T,T1).