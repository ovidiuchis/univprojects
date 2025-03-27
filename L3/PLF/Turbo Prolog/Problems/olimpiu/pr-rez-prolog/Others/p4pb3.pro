%Se da o lista de umere intregi.Se cere sa se 
%adauge in lista dupa 1-ul element ,al 3-lea,
%al 7-lea,al 15-lea ... o valoare data e.
%Exemplu: [1,2,3,4,5,6,7,8,9,10], e=0 ==>
%             [1,0,2,3,0,4,5,6,7,0,8,9,10]

domains
  el=integer
  lista=el*
predicates
  adaug(integer,lista,lista)
  adauga(integer,lista,lista,integer,integer)
clauses
  adauga(E,[],[],Poz,Con):-!.
  adauga(E,[H|T],[H|[E|L]],Poz,Con):-A=Poz*2+1,Con=A,!,Poz2=Poz*2+1,Con2=Con+1,adauga(E,T,L,Poz2,Con2).
  adauga(E,[H|T],[H|L],Poz,Con):-A=Poz*2+1,not (Con=A),!,Con2=Con+1,adauga(E,T,L,Poz,Con2).
  adaug(E,L1,L2):-Poz=0,Con=1,adauga(E,L1,L2,Poz,Con).