;8.a)Sa se scrie o functie care verifica daca un atom membru al
;unei liste nu neaparat liniara.

(defun membru(e l)
  (cond
       ((null l) nil)
       ((and (atom (car l))(equal (car l) e))t)
       ((atom (car l))(membru e (cdr l)))
       (t(membru e (car l))(membru e (cdr l)))
  )
)

;8.b)Sa se construiasac lista tuturor sublistelor unei liste.

(defun construct(l)
 (cond
    ((null l) nil)
    ((atom (car l))(list(car l)(construct (cdr l))))
    ((listp (car l))(list (car l)(construct (cdr l))))
   )
)

;8.c)Definiti o functie care selecteaza al n-lea element al unei liste,
;sau nil daca nu exista.

(defun select(n l)
  (cond
       ((null l) nil)
       ((= n 1)(car l))
       (t(select (- n 1) (cdr l)))
  )
)  

;8.d)Sa se scrie o functie care transforma o lista liniara intr-o multime.

(defun belongs(e l)
  (cond
     ((null l) nil)
     ((egual (car l) e)t)
     (t(belongs e (cdr l)))
  )
)
(defun adaug(e l)
  (cond
      ((null l) (list e))
      (t(cons l e))
  )
)
(defun multime1(l col)
   (cond
       ((null l) col)
       ((not(belongs (car l) col))(adaug (car l) col)(multime1 (cdr l) col))
       (t(multime1 (cdr l) col))
  )
)
(defun multime(l)
  (multime1 l nil)
)           
