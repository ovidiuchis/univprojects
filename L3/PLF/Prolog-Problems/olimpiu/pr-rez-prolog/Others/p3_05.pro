domains
	element=string
	treetype=tree(element,treetype,treetype);nil
predicates
	create_tree(element,treetype)
	insert_left(treetype,treetype,treetype)
	insert_right(treetype,treetype,treetype)
        i(treetype)
        invers(treetype,treetype)
        
clauses
	create_tree(A,tree(A,nil,nil)).
	insert_left(X,tree(A,_,B),tree(A,X,B)).
	insert_right(X,tree(A,B,_),tree(A,B,X)).
	

  i(X):-create_tree("a",A),create_tree("b",B),create_tree("c",C),
             create_tree("d",D),create_tree("e",E),insert_left(C,B,A1),
              insert_right(D,A1,A2),insert_left(A2,A,A3),insert_right(E,A3,X). 
              
  invers(tree(R,nil,D),tree(R,D,nil)):-!.
  invers(tree(R,S,nil),tree(R,nil,S)):-!.
  invers(tree(R,nil,nil),tree(R,nil,nil)):-!.
  invers(tree(R,S,D),tree(R,D1,S1)):-invers(D,D1),
     invers(S,S1).
     