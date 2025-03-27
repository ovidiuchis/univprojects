;Sa se determine lista atomilor de nivel n dintr-o lista neliniara
;(primul nivel al listei se considere 1)

(defun lista (l n)
  (cond
     ((and (= n 0)(atom l))(list l))
     ((= n 0) nil)
     ((atom l) nil)
     (t(mapcar '(lambda (l)(lista l (- n 1))) l))
  )
)  
