;4.a)Sa se construiasca o functie care intoarce maximul atomilor numerici
;dintr-o lista de la orice nivel

(defun maxim(l)
  (cond
       ((null l) 0)
       ((atom (car l))(max (car l)(maxim (cdr l))))
       (t(max (maxim (car l))(maxim (cdr l))))
  )
)
;4.c)Sa se scrie o functie care intoarce T daca o lista are numar par de
;elemente pe primul nivel si NIL in caz contrar, fara a se numere elementele
;listei

(defun par(l)
   (cond
       ((null l) t)
       ((= 0 (mod (length l) 2))t)
       (t nil)
  )
) 