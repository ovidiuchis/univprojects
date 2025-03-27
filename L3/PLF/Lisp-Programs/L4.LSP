; inversarea unei liste

(defun inverse(l)
  ( do (
         (lista l (cdr lista))
         (col nil)
        )
        ((null lista) col)
        (setq col (cons (car lista) col))
  )
)

;maximul atomilor numerici

(defun maximum(l)
  (prog ((lista l)(m 0))
       et
         (cond
           ((null lista)(return m))
           ((numberp (car lista))(setq m (max m (car lista)))
              (setq lista (cdr lista))(go et))
           (t(setq lista (cdr lista))(go et))
       )
 )
) 
