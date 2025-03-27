;Sa se determina suma primelor n elemente numericie
;dintr-o lista liniara.

(defun suma(l n)
  (cond
     ((null l) 0)
     ((= n 0) 0)
     ((numberp (car l))(+ (car l)(suma (cdr l) (- n 1))))
     (t(suma (cdr l) n))
  )
)  
