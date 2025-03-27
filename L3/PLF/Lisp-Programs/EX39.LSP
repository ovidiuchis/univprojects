;5.a)Sa se scrie o functie care realizeaza o lista de asociere cu cele doua
;liste pe care le primeste

(defun asociere(a b)
  (cond
       ((null a) nil)
       ((null b) nil)
       (t(cons (cons (car a) (car b)) (asociere (cdr a) (cdr b))))
  )
)

;5.b)Sa se determine numarul sublistelor unei liste date pe orice nivel

(defun nrsubl(l)
  (cond
       ((null l) 0)
       ((atom l) (nrsubl (cdr l)))
       (t(listp (car l))(+ 1 (nrsubl (car l))) (nrsubl (cdr l)))
  )
)
;5.c)Sa se scrie de doua ori elementul de pe pozitia a n-a a unei liste
;liniare.

(defun inserez(l n)
  (cond
       ((null l) nil)
       ((= n 1)(cons (car l) l))
       (t(cons (car l) (inserez (cdr l) (- n 1))))
  )
)
