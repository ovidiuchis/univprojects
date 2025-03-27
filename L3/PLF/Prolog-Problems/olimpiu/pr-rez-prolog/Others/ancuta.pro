/*
12.  Intr-o lista L sa se inlocuiasca toate aparitiile unui element E cu
     elementele unei alte liste, L1. Exemplu: inloc([1,2,1,3,1,4],1,[10,11],X)
     va produce X=[10,11,2,10,11,3,10,11,4].
*/

domains
list=integer*
predicates
concatenare(list,list,list)
inloc(list,integer,list,list)
add_end(integer,list,list)
clauses

add_end(E,[],[E]).
add_end(E,[H|T],[H|T1]):-add_end(E,T,T1).

concatenare(L,[],L).
concatenare(L1,[H|T],L):-add_end(H,L1,L11),
			concatenare(L11,T,L).		

inloc([],_,_,[]).
inloc([H|T],E,L,Lr):-H=E,!,inloc(T,E,L,Lrr),
			concatenare(L,Lrr,Lr).
inloc([H|T],E,L,[H|Lr]):-inloc(T,E,L,Lr).		     

