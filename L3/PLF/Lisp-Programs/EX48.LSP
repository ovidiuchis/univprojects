;
(defun ins (e arb)
  (cond
     ((null arb) (list e))
     ((< e (car arb))(list (car arb) (ins e (cadr arb))(ins e (caddr arb))))
     (t(list (car arb)(cadr arb)(ins e (caddr arb))))
  )
)

(defun arbore(l)
  (cond
    ((null l) nil)
    (t(ins (car l) (arbore (cdr l))))
 )
)
(defun inord(arb)
  (cond
    ((null arb) nil)
    (t(append (inord (cadr arb))(list (car arb))(inord (caddr arb))))
   )
)
(defun sort(l)
  (inord (arbore l))
)
