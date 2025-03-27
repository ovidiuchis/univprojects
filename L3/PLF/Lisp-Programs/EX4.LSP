;Sa se construiasca o lista liniara cu atomii numerici de la
;orice nivel ai unei liste neliniara

(defun atomi (l)
   (cond
        ((null l) nil)
	((numberp (car l))(cons (car l) (atomi (cdr l))))
        ((listp (car l))(append (atomi (car l))(atomi (cdr l))))
        (t(atomi (cdr l)))
   )
) 
