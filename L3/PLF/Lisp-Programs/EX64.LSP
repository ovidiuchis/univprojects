;L3.11)Sa se scrie o functie care calculeaza suma numerelor pare minus
;suma numerelor impare la toate nivelurile unei liste.

(defun par(l)
  (cond
        ((= 0 (mod l 2))t)
        (t nil)
   )
)
(defun sumapar(l)
   (cond
        ((and(numberp l)(par l)) l)
        ((atom l) 0)
        (t(apply '+ (mapcar 'sumapar l)))
  )
)
(defun sumainpar(l)
    (cond
         ((and (numberp l)(not(par l))) l)
         ((atom l) 0)
         (t(apply '+ (mapcar 'sumainpar l)))
    )
)

(defun calc(l)
   (- (sumapar l) (sumainpar l))
) 
