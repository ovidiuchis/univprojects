;Inversarea unei liste

(defun rev(l col)
  (cond
     ((null l) col)
     (t(rev (cdr l)(cons (car l) col)))
  )
)
(defun reverse(l)
  (rev l nil)
)
