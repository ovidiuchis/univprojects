;2.c)Sa se construiasca o functie care intoarce produsul atomilor numerii
;dintr-o lista,de la nivelul superifical.

(defun produs(l)
  (cond
      ((null l) 1)
      ((numberp (car l))(* (car l) (produs (cdr l))))
      (t(produs (cdr l)))
  )
)

;2.d)Definiti o functie care,dintr-o lista de atomi, produce o lista de 
;perechi (atom n),unde atom apare in lista initiala de n ori.

(defun per(e1 e2)
  (cond
         ((null e1) nil)
         (t(list e1 e2))
  )
)
(defun nrap(e l)
  (cond
         ((null l) 0)
         ((equal (car l) e)(+ 1 (nrap e (cdr l))))
         (t(nrap e (cdr l)))
  )
)
(defun perechi(l g)
   (cond
        ((null l) nil)
        (t(cons (per (car l) (nrap (car l) g)) (perechi (cdr l) g)))
   )
) 
(defun pereche(l)
  (perechi l l)
)
