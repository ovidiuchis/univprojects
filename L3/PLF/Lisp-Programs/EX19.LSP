;Se da o lista ne-liniara, sa se determine lungimea listei in numar de atom
;la orice nivel

(defun lg(l)
  (cond
     ((atom l) 1)
     (t(apply '+ (mapcar 'lg l)))
  )
)
