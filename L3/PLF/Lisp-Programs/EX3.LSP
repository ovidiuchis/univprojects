;Sa se determine al n-lea element al unei liste la nivel superificial

(defun elem(l n)
   (cond
        ((null l) nil)
        ((= n 1) (car l))
        (t(elem (cdr l) (- n 1)))
  )
)
