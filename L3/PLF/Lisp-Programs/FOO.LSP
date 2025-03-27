;Inversarea unei liste la nivel superficial.

(defun reverse(l)
  (cond
     ((null l)nil)
     (t(cons (reverse (cdr l))(car l)))
  )
)
