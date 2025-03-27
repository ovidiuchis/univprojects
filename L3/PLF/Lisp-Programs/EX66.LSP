;L3.13)Definiti o functie care substituie un element E prin elementele
;ueni liste l1 la toate nivelurile unei liste date.

(defun subst(l e l1)
   (cond
        ((equal l e) l1)
        ((atom l) l)
        (t(mapcar '(lambda (l) (subst l e l1)) l))
  )
)
