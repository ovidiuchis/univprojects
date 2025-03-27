;14.c)Sa se insereze intr-o lista liniara un atom a dat dupa al
;2-lea,al 4-lea,al 6-lea...element

(defun ins(e n l)
   (cond
       ((null l) nil)
       ((= n 1) (cons e l))
       (t(cons (car l) (ins e (- n 1) (cdr l)))) 
   )
)

(defun inser(e n l)
  (cond
     ((null l) nil)
     ((= n 0) nil)
     (t(inser e (- n 2) (ins e n l)))
  )
)
(defun insert(e l)
  (cond
      ((= 0 (mod (length l) 2))(inser e (length l) l))
      (t(inser e (+ (length l) 1) l))
 )
)  
