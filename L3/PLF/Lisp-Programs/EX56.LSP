;L3.2)Sa se construiasca o functie care intoarce suma atomilor numerici
; dintr-o lista de la orice nivel.

(defun suma(l)
    (cond
        ((null l) 0)
        ((numberp l) l)
        ((atom l) 0)
        (t(apply '+ (mapcar 'suma l)))
  )
)		
