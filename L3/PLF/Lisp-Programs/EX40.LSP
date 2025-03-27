;6.b)Definiti o functie care sorteaza cu pastrearea dublurilor o
;lista liniara.

(defun inserez(e l)
  (cond
       ((null l) (list e))
       ((<= e (car l)) (cons e l))
       (t(cons (car l) (inserez e (cdr l)))) 
 )
)
(defun sort(l col)
   (cond
       ((null l) col)
       (t(sort (cdr l) (inserez (car l) col)))
  )
)
(defun sortare(l)
   (sort l nil)
)
       
;6.c)Sa se scrie o functie care intoarce reuniunea a doua multimi

(defun reun(m1 m2)
   (cond
         ((null m1) m2)
         ((null m2) m1)
         (t(cons (car m1) (reun (cdr m1) m2)))
  )
)

;6.d).Definiti o functie care inverseaza o lista

(defun invers(l)
  (cond
       ((null l) nil)
       (t(append (invers (cdr l)) (list(car l))))
  )
)
