;Inversarea unei liste la nivel superficial.

(defun reverse(l)
  (cond
     ((null l)nil)
     (t(append (reverse (cdr l))(list (car l))))
  )
)
