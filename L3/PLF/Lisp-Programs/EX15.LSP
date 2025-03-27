;Permutari

(defun ins (e p l)
  (cond
     ((= p 1) (cons e l))
     (t(cons (car l) (ins e (- p 1 ) (cdr l))))
  )
)

(defun perm1(e n l)
   (cond
     ((= n 0) nil)
     (t(cons (ins e n l)(perm1 e (- n 1) l)))
   )
)
(defun perm(l n)
  (cond
     ((null l) nil)
     (t(cons (perm1 (car l) n (cdr l))(perm1 (car l) n (reverse (cdr l)))))
  )
)
(defun permutare(l)
  (perm l (length l))
)

