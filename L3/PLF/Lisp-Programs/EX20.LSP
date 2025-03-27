;Sa se determine nr. de aparitii ale unui element e intr-o lista 
;neliniara , la orice nivel.

;Var 1

(defun nrap(l e)
  (cond
     ((equal l e) 1)
     ((atom l) 0)
     (t(apply '+ (mapcar '(lambda (l) (nrap l e)) l)))
  )
)
(defun nrap1(l e)
   (defun f(l)
     (nrap1 l e)
   )
   (cond 
       ((equal l e) 1)
       ((atom l) 0)
       (t(apply '+ (mapcar 'f l)))
  )
)      
