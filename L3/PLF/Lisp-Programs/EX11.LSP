;Concatenarea a doua liste

(defun append1(l1 l2)
   (cond
       ((null l1) l2)
       (t(cons (car l1)(append1 (cdr l1) l2)))
   )
)
