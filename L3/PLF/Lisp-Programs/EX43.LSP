;10.a)Sa se construiasca o functie care intoarce adancimea unei liste.

(defun adancime(l)
   (cond
       ((null l) 0)
       ((listp (car l))(+ 1 (adancime (car l))(adancime (cdr l))))
       (t(adancime (cdr l)))
  )
)
;10.b)Dandu-se o lista, sa se construiasca lista primelor elementelor
;ala tururor elementelor lista ce au un numar impar de elemente la
;nivel superifical.

(defun impar(l)
  (cond
       ((null l)nil)
       ((= 0 (mod (length l) 2))nil)
       (t t)
  )
) 

(defun prim(l)
    (cond
        ((null l) nil)
        (t(car l))
   )
)

(defun lista(l)
 (cond
     ((null l) nil)
     ((and(atom (car l))(impar l))(list (prim l) (lista (cdr l))))
     ((and(listp (car l))(impar (car l))(append (lista (car l))(lista (cdr l))
       )))
     (t(lista (cdr l)))
  )
)   
