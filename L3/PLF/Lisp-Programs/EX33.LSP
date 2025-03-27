;Sa se defineasca o functie care avand ca parametrii doua matrice de
;ordin n returneaza produsul acestora.

(defun coloane(l)
  (cond
       ((null (car l))nil)
       (t(cons (mapcar 'car l)(coloane (mapcar 'cdr l))))
  )
)
(defun pr(l1 l2)
  (cond
        ((null (car l1))nil)
        (t(cons (mapcar '(lambda (l)
                 (apply '+(mapcar '*(car l1) l))
            )
           l2
         )
         (pr (cdr l1) l2)))
    )
)
(defun produs(l1 l2)
 (pr l1 (coloane l2))
)
