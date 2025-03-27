;L3.1)Sa se construiasca o lista care intoarce numarul atomilor,
;dintr-o lista de la orice nivel.

(defun nr(l)
  (cond
        ((null l) 0) 
	((atom l) 1)
        (t(apply '+ (mapcar 'nr l)))
)
)
