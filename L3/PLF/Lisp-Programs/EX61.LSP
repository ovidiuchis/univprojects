;L3.7)Sa se construiasca o functie care verifica daca un atom e membru
;al unei liste nu neaparat liniara.

(defun membru(l e)
  (cond 
      ;((null l) nil)
      ((and (atom l)(equal l e)) t)
      ((atom l) nil)
      (t(mapcar '(lambda (l) (membru l e)) l))
  )
) 
