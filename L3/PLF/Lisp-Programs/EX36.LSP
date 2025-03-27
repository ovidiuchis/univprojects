;1.a.Definiti o functie care obtine dintr-o lista data lista tururor atomilor
; care apar, pe orice nivel, dar in aceassi ordine.

(defun lista(l)
   (cond
        ((null l) nil)
        ((atom l)(list l))
        (t(listp l)(append (lista (car l)) (lista (cdr l))))
    )
)    

;1.c)Sa se construiasca o functie care intoarece maximul atomilor numerici
;dintr-o lista, de la nivelul superifical.

(defun maxim(l)
   (cond
         ((null l) 0)
         (t(max (car l) (maxim (cdr l))))
  )
)
;1.d)Definiti o functie care intoarce suma a doi vectori

(defun suma(a b)
  (cond
       ((null a) b)
       ((null b) a)
       (t(cons (+ (car a) (car b))(suma (cdr a) (cdr b)))) 
  )
) 
