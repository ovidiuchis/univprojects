;Sa se elimine dintr-o lista neliniara atomii numerici negativi.

(defun elimin1(l)
   (cond
      ((and(numberp l)(minusp l))nil)
      ((atom l)(list l))
      (t(list (mapcan 'elminin1 l)))
  )
) 
(defun elimin(l)
  (car (elimin1 l))
)
