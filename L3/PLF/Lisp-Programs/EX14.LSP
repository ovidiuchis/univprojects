;Submultimiile unei multimi de intregi reprezentate ca lista

(defun ins(e l)
 (cond
    ((null l) nil)
    (t(cons (cons e (car l))(ins e (cdr l)))) 
 )
)
(defun subm(l)
  (cond
       ((null l) (list nil))
       (t(append (subm (cdr l))(ins (car l) (subm (cdr l)))))
  )
) 
