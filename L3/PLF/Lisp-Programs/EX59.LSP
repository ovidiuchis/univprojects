;L3.5)Sa se construiasca o functie care intoarce maximul atomilor numerici
;dintr-o lista ,de la orice nivel.

(defun maxim(l)
  (cond
       ((numberp l) l)
       ((atom l) 0)
       (t(apply 'max (mapcar 'maxim l)))
  )
) 
