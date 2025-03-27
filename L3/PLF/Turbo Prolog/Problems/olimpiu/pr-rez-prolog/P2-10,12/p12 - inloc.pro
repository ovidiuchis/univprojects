%Intr-o lista L sa se inlocuiasca toate aparitiile unui element E 
%cu elementele unei alte liste, L1. 
%Exemplu: inloc([1,2,1,3,1,4],1,[10,11],X) va produce X=[10,11,2,10,11,3,10,11,4].
domains
  el=integer
  list=el*
predicates
  inloc(list,el,list,list)
  pune(list,list,list)
clauses
  pune([],L,L):-!.
  pune(L,[],L):-!.
  pune([H|T],[S1|S2],[S1|I2]):-pune([H|T],S2,I2).
  inloc([],_,_,[]):-!.
  inloc(L,_,[],L):-!.
  inloc([P1|P2],E,S,I):-P1=E,inloc(P2,E,S,I1),pune(I1,S,I),!.
  inloc([P1|P2],E,S,[P1|I]):-P1<>E,inloc(P2,E,S,I).
goal:
  inloc([1,2,1,3,1,4,7,1,1,1],1,[0,0,0,0,0],X).