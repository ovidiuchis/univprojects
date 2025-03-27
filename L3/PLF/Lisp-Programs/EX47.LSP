;
(defun p(l)
  (prog ((i 0))
    (return (mapcar '(lambda (l) (setq i (+ i 1))(+ i l) l)))
   )
)
;Sa de o lista de liste ,se cere o lista liniara cu elementele maxime din
;sublista a caror maxim este par

(defun maxim(l)
  (cond
    ((numberp l) l)
    ((atom l) -32000)
    (t(apply max (mapcar 'maxim l)))
  )
)
(defun f(l)
  ((lambda (v)
     (cond
          ((= 0 (mod v 2))(list v))
          (t nil)
      )
      ) (maxim l)
   )
)
(defun lista(l)
  (mapcan 'f l)
)
