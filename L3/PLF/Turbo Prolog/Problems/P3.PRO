/* Sa se construiasaca un predicat care intoarce
 numarul nodurilor unui arbore binar*/
 
domains
        element=integer
        treetype=tree(element,treetype,treetype);nil
predicates
          create_tree(element,treetype)
          insert_left(treetype,treetype,treetype)
          insert_right(treetype,treetype,treetype)
clauses 
          create_tree(N,tree(N,nil,nil)).           
          insert_left(X,tree(A,_,B),tree(A,X,B)).
          insert_right(X,tree(A,B,_),tree(A,B,X)).
goal
          /*creaza celulele*/
          create_tree(1,A1),
          create_tree(2,A2),
          create_tree(3,A3),
          create_tree(4,A4),
          
          /*leaga celulele*/
          insert_left(A1,A2,A3),
          insert_right(A2,A4,ArboreFinal),
          
          /*tipareste rezultatul*/
          write(ArboreFinal),nl.	
          