;L3.3)Definiti o functie care inlocuieste un nod cu altul intr-un arbore
;n-ar.

(defun modif(l n m)
   (cond
        ((equal l n) m)
        ((atom l) l)
        (t(mapcar '(lambda (l) (modif l n m)) l))
  )
) 
