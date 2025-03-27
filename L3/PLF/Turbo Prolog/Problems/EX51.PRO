/*P1.2b)Sa se scrie un predicat care, primind
o lista, intoarce multimea tuturol perechilor din 
lista.*/

domains
	list=integer*
	mul=list*
predicates
	listmul(list,mul)
clauses
	listmul([],[]).
	listmul([E|[E2|T1]],[[E,E2]|T2]):-E<>E2,!,listmul([E2|T1],T2).
	listmul([E|T1],T2):-listmul(T1,T2).