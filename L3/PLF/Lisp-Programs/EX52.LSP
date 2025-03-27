;L2.7)Sa se converteasca un arbore de tipul (2) la un arbore de tipul (1)

(defun convert(arb)
    (cond
        ((null arb) nil)
        (t(append (list (car arb) (- (length arb) 1))(convert (cadr arb))
                  (convert (caddr arb))))
   )
)  
