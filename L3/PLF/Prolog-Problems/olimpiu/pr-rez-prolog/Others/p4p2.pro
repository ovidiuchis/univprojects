domains
 el=integer
 lista=el*
 element=i(integer);l(lista)
 listad=element*

predicates 
 elim(listad,listad)
 
clauses
 elim([],[]).
 elim([l(L)|[]],[l(L)|[]]).
 elim([l(_)|[l(_)|[l(_)|T]]],T1):-elim(T,T1),!.
 elim([l(_)|[l(_)|T]],T1):-elim(T,T1). 
 elim([i(N)|T],[i(N)|T1]):-elim(T,T1). 
 
 
 
 elim([l(L1)|[i(N)|T]],[l(L1)|[i(N)|T1]]):-elim(T,T1).