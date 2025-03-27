;L3.12)Definiti o functie care substituie un element cu altul la
;toate nivelurile unei liste date.

(defun subst(l e1 e2)
   (cond
        ((equal l e1) e2)
        ((atom l) l)
        (t(mapcar '(lambda(l) (subst l e1 e2)) l))
  )
) 
