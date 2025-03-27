;Perechi

(defun per(e l)
  (cond
       ((null l) nil)
       (t(cons (list e (car l))(per e (cdr l))))
  )
)
(defun perrechi(l)
  (cond
     ((null l) nil)
     (t(append (per (car l) (cdr l))(perechi (cdr l))))
  )
) 
