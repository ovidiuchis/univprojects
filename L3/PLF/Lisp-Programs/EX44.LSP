;Definiti o functie care substituie un element E prin elementele unei
;liste l1 la toate nivelurile unei liste date L.

(defun subst(e l1 l)
   (cond
       ((null l) nil)
       ((equal (car l) e)(append (append l1 (cdr l)) (subst e l1 (cdr l))))
       (t(append (car l)(subst e l1 (cdr l))))
  )
)

;12.c)Definiti o functie care interclaseaza cu pastrearea dublurilor
;doua liste liniare sortate.

(defun ins(e l)
  (cond
     ((null l) nil)
     ((>= (car l) e)(cons e l))
     (t(append (list (car l)) (ins e (cdr l))))
  )
)   
(defun interc(l1 l2)
   (cond
     ((null l1) l2)
     ((null l2) l1)
     (t(interc (cdr l1) (ins (car l1) l2)))
   )
)  

;12.d)definiti o functie care intoarce cel mai mare divizor comun al
;numerelor dintr-o lista liniara.

(defun cmd(a b)
   (cond
       ((= a 0) b)
       ((= b 0) a)
       ((= a b) a) 
       ((> a b)(cmd (- a b) b)) 
       ((< a b)(cmd a (- b a)))
   )
)

(defun cmdlista(l)
   (cond
        ((null l) 0)
        (t(cmd (car l) (cmdlista (cdr l))))
  )
)  

;12.b)Definiti o functie care determina suma a doua numere in reprezentare de
;lista si caluleaza numarul zecimal corespunzator sumei.

(defun invers(l)
    (cond
         ((null l) nil)
         (t(append (invers (cdr l))(list (car l))))
   )
)
(defun add1(a)
  (cond
       ((null a) 1)
       (t(append (list (+ (car a) 1)) (cdr a)))
  )
) 
(defun suma(a b)
   (cond
        ((null a) b)
        ((null b) a)
        ((> (+ (car a) (car b)) 9)(append (list 0)
                  (suma (add1(cdr a)) (cdr b))))
        (t(append (list (+ (car a) (car b))) (suma (cdr a) (cdr b))))
    )
)
(defun suma1(a b)
  (invers (suma (invers a) (invers b)))
)
