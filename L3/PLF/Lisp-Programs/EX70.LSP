;Succesorul unui numar.

(defun inv(l)
  (cond
       ((null l) nil)
       (t(append (inv (cdr l)) (list (car l))))
  )
)

(defun notten(e)
  (cond
    ((equal 10 (+ 1 e )) nil)
    (t)
  )
)
(defun succesor(l)
  (cond
       ((null l) nil)
       ((notten (car l)) (cons (+ (car l) 1) (cdr l)))
       (t
           (cond
                  ((null (cdr l)) (cons 0 (cons 1 nil)))
                  (t (cons 0 (succesor (cdr l))))
            )
       )
   )
)
(defun suc(l)
  (inv (succesor (inv l)))
) 
