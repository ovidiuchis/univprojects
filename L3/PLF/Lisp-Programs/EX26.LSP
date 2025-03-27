;Sa se determine nr. de noduri dintr-un arbore n-ar

(defun nr(l)
  (cond
       ((null l) 0)
       ((null (cdr l)) 1)
       (t(+ 1 (apply '+ (mapcar 'nr (cdr l)))))
  )
)
