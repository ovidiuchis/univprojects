;Sa se defineasca o functie care sa returneze multimea formata
;din listele obtinute prin inserarea unui element pe pozitiile
;1,2...lungime listei L+1 intr-o lista L

(defun ins(e p l)
  (cond
    ((= p 1)(cons e l))
    (t(cons (car l)(ins e (- p 1) (cdr l))))
  )
)

(defun insert(e n l)
   (cond
        ((= n 0) nil)
        (t(cons (ins e n l)(insert e (- n 1) l)))
   )
)
(defun inserare(e l)
   (insert e (+ (length l) 1) l)
)
