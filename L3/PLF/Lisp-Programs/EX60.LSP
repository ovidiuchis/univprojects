;L3.6)Sa se construiasca o functie care intoarce atancimea unei liste.

(defun adancime(l)
  (cond
         ((null (cdr l)) 0)
         (t(+ 1 (apply 'max (mapcar 'adancime (cdr l)))))
  )
)
