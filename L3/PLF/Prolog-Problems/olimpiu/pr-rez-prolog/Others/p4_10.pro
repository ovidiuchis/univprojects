/*10. Se da o lista de numere intregi. Se cere sa se elimine toate subsirurile
    formate din elemente descrescatoare.
*/
domains
   list=integer*
predicates
   elimina(list,list)
clauses
  elimina([],[]):-!.
  elimina([E],[E]):-!.
  elimina([E1|[E2]],[]):-E1>E2,!.
  elimina([E1|[E2]],[E1|[E2]]):-E1<=E2,!.
  elimina([E1|[E2|[E3|T]]],T1):-E1>E2,E2>E3,!,elimina([E2|[E3|T]],T1).
  elimina([E1|[E2|[E3|T]]],T1):-E1>E2,E3>=E2,!,elimina([E3|T],T1).
  elimina([E1|[E2|T]],[E1|T1]):-E1<=E2,!,elimina([E2|T],T1).
  
  