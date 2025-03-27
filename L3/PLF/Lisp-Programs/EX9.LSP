;Sa se defineasca o functie care sa returneze lista obtinuta prim inserarea
;unui element pe o anumita pozitie p intr-o lista l.

(defun inserez(e p l)
  (cond
       ((= p 1)(cons e l))
       (t(cons (car l)(inserez e (- p 1) (cdr l))))
   )
)
