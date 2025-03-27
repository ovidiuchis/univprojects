;Sa se construiasca lista nodurilor unui arbore de tipul (2)
;parcurs in inordine

(defun inorder(arb)
   (cond
      ((null arb) nil)
      (t(append (inorder (cadr arb))(list (car arb))(inorder (caddr arb))))
  )
)
