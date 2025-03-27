;Sa se defineasca o functie care sa determine lista perechilor
;dintre un atom si elementele unei liste.

(defun lista(e l)
  (cond
       ((null l) nil)
       (t(cons (list e (car l))(lista e (cdr l))))
  )
) 
