domains
 list=integer*
predicates
  subst(integer,integer,list,list)
clauses
  subst(A,B,[],[]):-!.
  subst(A,B,[H|T],[B|L]):-A=H,!,subst(A,B,T,L).
  subst(A,B,[H|T],[H|L]):-subst(A,B,T,L).