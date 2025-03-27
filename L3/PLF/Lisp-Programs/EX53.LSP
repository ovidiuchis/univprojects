;L2.9)Se da un arbore de tipul (2). Sa se precizeze nivelul pe care apare
;un nod x in arbore. Nivelul radacini se considera a fi 0.

(defun nivel(nod arb)
  (cond
       ((null arb) -1)
       ((equal (car arb) nod) 0)
       (t(+ 1 (max (nivel nod (cadr arb)) (nivel nod (caddr arb)))))
  )
)  
