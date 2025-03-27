(defun para (l)
  (cond 
	((equal (mod (length l) 2) 0) t)
	(t nil)
   )
)

(defun aplAnd(l)
   (cond
	((null l) t)
	(t (and (car l) (aplAnd (cdr l))))
   )
)

(defun subPara (l)
  (cond
	((atom l) t)
	((not (para l)) nil)
	(t (funcall 'aplAnd (mapcar 'subPara l)))
  )
)


