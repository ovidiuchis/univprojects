/*Sa da o lista l. Sa se genereze toate subm 
ca un k elemente in prog. aritm.*/

domains
	elem=integer
	list=elem*
predicates
	 candidat(list,elem)
	 subm(list,elem,list)
	 subm_aux(list,elem,list,list,elem,elem)
clauses
	candidat([E|_],E).
	candidat([_|T],E):-
		candidat(T,E).
	subm(L,K,Lr):-
		candidat(L,E),
		candidat(L,H),
		E<H,
		R=H-E,
		subm_aux(L,K,Lr,[E,H],2,R).
	subm_aux(_,L,Col,Col,K,_):-!.
	subm_aux(L,K,R2,[H|T],K1,R):-
		candidat(L,E),
		H-E=R,
		E<H,
		K2=K1+1,
		subm_aux(L,K,R2,[E|[H|T]],K2,R).