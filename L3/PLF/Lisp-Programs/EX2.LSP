;Produsul atomilor numerici par.
; la nivel superficial.

(defun par (e)
   (cond
      ((= 0 ('mod e 2 ))t)
      (t nil)
   )
   (t)
)

(defun produs (l)
   (cond
       ((null l) 1)
       ((and(numberp (car l))(par (car l)))(* (car l) (produs (cdr l))))
       (t(produs (cdr l)))
    )
) 

;la orice nivel

(defun produs1 (l)
   (cond
       ((null l) 1)
       ((and(numberp (car l))(par (car l)))(* (car l)(produs1 (cdr l))))
       ((listp (car l))(* (produs1 (car l))(produs1 (cdr l))))
       (t(produs (cdr l)))
   )
)
