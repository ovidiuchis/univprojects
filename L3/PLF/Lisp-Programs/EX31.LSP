;Sa se defineasca o functie care avand ca parametru o listaneliniara sa
;returneze T daca toate sublistele(inclusiv lista) au lungime numar par
;(la nivel superficial),Nil in caz contrar.

(defun par(l)
   (cond
        ((= 0 (mod (length l) 2))T)
        (t nil)
  )
)
(defun verif(l)
  (defun si(l)
       (cond
             ((null l) t)
             ((not (car l)) nil)
             (t(si(cdr l)))
     )
   )
  (cond
        ((atom l) t)
        ((not (par l))nil)
        (t(funcall 'si (mapcar 'verif l)))
   )
)  
