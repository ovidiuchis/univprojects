;Sa se determine adancimea unui arbore n-ar.

(defun adancime(l)
   (cond
      ((null (cdr l)) 0)
      (t(+ 1 (apply 'max (mapcar 'adancime (cdr l)))))
  )
)
