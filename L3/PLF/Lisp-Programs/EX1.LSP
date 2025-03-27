; Sa se scrie o functie care determina primul atom al unei liste 
; la nivel superficial.

(defun prim1 (l)
 (cond
     ((null l) nil)
     ((listp (car l))(prim1 (cdr l)))
     (t(car l))
  )
)

;la orice nivel

(defun prim (l)
  (cond
      ((null l) nil)
      ((atom (car l))(car l))
      (t(prim (car l)))
  )
)  
  

