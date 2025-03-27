
domains
        elem=integer
        lista=elem*
predicates
          detpozi(lista,elem)
          detpozi2(lista,elem,elem)
          detpozp(lista,elem)
	  detpozp2(lista,elem,elem,elem)
	  sterge(elem,lista,lista)
	  %cu modelul de flux (o,i,i,)
	  %unde parametrul al doilea e o lista sterge
	  %lista din lista initiala
	  lista_noua(lista,lista)         
          lista_noua1(lista,lista,elem)
clauses
        detpozi2([],_,0).
        detpozi2([_],_,0).
        detpozi2([H|[H1|T]],In,R):-
            H1<>H+1,
            I1=In+1,
            detpozi2([H1|T],I1,R).     
       detpozi2([H|[H1|_]],In,R):-
              H1=H+1,R=In+1.
       detpozi(L,In):-detpozi2(L,0,In).       
       /*detpozp([H|[H1|T]],In,S):-
            H1=H+1,
            I1=In+1,
            detpozp([H1|T],In,S).*/
       detpozp(L,S):-
       		detpozi(L,I),
       		write("I="),write(I),nl,
       		detpozp2(L,I,1,S).
       
       %detpozp2([],I,_,I):-!.
       detpozp2(_,0,_,0):-!.
       detpozp2([_|T],I,C,S):-C<=I,C1=C+1,
       		detpozp2(T,I,C1,S).
       detpozp2([H|[H1]],I,C,C):-
       		C>I,write("C="),write("C="),
       		H1<>H+1.
       detpozp2([H|[H1]],I,C,C1):-
              C>I,write("C="),write(C),
              H1=H+1,
              C1=C+1.
       detpozp2([H|[H1|T]],I,C,S):-
       		C>I,H1=H+1,
            	C1=C+1,
            	detpozp2([H1|T],I,C1,S).
       detpozp2([H|[H1|_]],I,C,C):-
       		C>I,H1<>H+1.     	
       
      /* detpozp2([H|[H1|[]]],I,C,C):-C>I,H1<>H+1.
       detpozp2([H|[H1|[]]],I,C,C1):-
       		C>I,write("C="),nl,
       		H1=H+1,
       		C1=C+1.		*/
       sterge(E,L,[E|L]).
       sterge(E,[A|L],[A|X]):-
           sterge(E,L,X).
       lista_noua(L,L1):-
          lista_noua1(L,L1,0).
       lista_noua1([H|T],L1,P):-
               detpozi(L,I),
               write("i=",I),
               detpozp2(L,I,1,S),
               P1=P+1,
               P1>=I,P1<=S,
               sterge(H,L,L1),
               lista_noua1(T,L1,P1).