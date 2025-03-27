;inlocuieste un nod cu un alt nod intr-un arbore n-ar
(defun modif(l n m)
     (cond
        ((equal l n) m)
        ((atom l) l)
        (t (mapcar '(lambda (l) (modif l n m)) l))
)
) 
