;L2.2)Sa se construiasca lista nodurilor unui arbore de tipul (2)
;parcurs in postordine.

(defun postorder(arb)
  (cond
     ((null arb) nil)
     (t(append (postorder (cadr arb))(postorder (caddr arb))
               (list (car arb))))
    )
)
