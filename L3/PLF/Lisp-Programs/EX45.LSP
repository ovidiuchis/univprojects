;13.b)Sa se elimine toate aparitiile elementului numeric maxim dintr-o lista
;neliniara.

(defun maxim(l)
  (cond
      ((null l) 0)
      ((numberp (car l))(max (car l) (maxim (cdr l))))
      ((listp (car l))(max (maxim (car l))(maxim (cdr l))))
      (t(maxim (cdr l)))
  )
) 

(defun elim(l)
  (cond
      ((and(atom l)(numberp l)(equal l (maxim l)))nil)
      ((atom l)(list l))
      (t(list (mapcan 'elim l)))
  )
)
(defun elimin(l)
  (car (elim l))
)
