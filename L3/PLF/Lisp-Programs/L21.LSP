(defun postorder(l)
     (cond
        ((null l) nil)
        ((atom (car (cadr l)))(list (cadr l) (caddr l) (car l)))  
        (t(postorder(car(cadr l))))
   )
)            
(defun p(l)
    (cond
      ((null l) nil)  
     (t (append (p (cadr l)) (p (caddr l)) (list (car l) )))
   )
) 

