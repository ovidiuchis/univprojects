;L2.3).Sa se construiasca lista nodurilor unui arbore de tipul (2)
;parcurs in preordine

(defun preorder(arb)
  (cond
     ((null arb) nil)
     (t(append (list (car arb))(preorder (cadr arb))(preorder (caddr arb))))
  )
)  
