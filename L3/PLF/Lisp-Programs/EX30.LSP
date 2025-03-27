;Sa se defineasca o functie care avand ca parametru o lista
;neliniara sa returneze lista parametru din care au fost elminati
;atomii numerici de la orice nivel.

(defun elim(l)
   (cond
        ((and (atom l)(numberp l)(minusp l))nil)
        ((atom l)(list l))
        (t(list (mapcan 'elim l)))
   )
)
(defun elimin(l)
  (car (elim l))
)
 
