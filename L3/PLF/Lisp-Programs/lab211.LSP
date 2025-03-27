(defun inv(l)
    (cond 
   	 ((null l) nil)
   	  (t (append (inv (cdr l)) (list (car l))))
     )
)
(defun notten(e)
     (cond
          ((equal 10 (+ 1 e)) nil)
          (t)
       )
)  
(defun succesor(l)
  (cond
     ((null l) nil)
     ((notten(car l))(cons (+ (car l) 1) (cdr l)))
     (t 
	(cond 
		((null (cdr l) ) (cons 0 (cons 1 nil)))
		(t (cons  0 (succesor(cdr l))))
	)  
     )
  )
)
 
(defun suc(l)
   ( inv(succesor(inv l)))
)    
(defun apare(e l)
    (cond
         ((null l) nil)
         ((equal (car l) e))
         (t(apare e (cdr l))) 
     )
   )
(defun verifica(l)
    (cond
        ((null l) t)
        ((apare (car l) (cdr l))nil)
        (t (verifica(cdr l)))
    )
) 

(defun ins(e l)
    (cond
       ((null l) (cons e nil) )
       (t (cons (car l) (ins e (cdr l)))) 
  )
)   

(defun constr(l)
   (cond
     ((null l) nil)
     ((apare (car l) (cdr l)) (constr (cdr l) ))
     (t (cons  (car l) (constr (cdr l) )))
   )
)
(defun constr2( l g)
  (cond
     ((null l ) g)
     ((apare (car l) g) (constr2 (cdr l) g))
     (t ( (ins (car l) g) (constr2 (cdr l) g) )) 
)
)
		

(defun delete(l n)
   (cond
        ((null l) nil)
        ((= 1 n) (cdr l))
        (t(cons (car l) (delete (cdr l) (- n 1))))
  )
)

(defun g(e)
(cond
	((not (atom e)) "nu e atom")
	( t "e ok")
)
)
