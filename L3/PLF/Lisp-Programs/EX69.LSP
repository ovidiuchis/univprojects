;L3.9.)Definiti o functie care determina numarul nodurilor de pe nivelul k
;dintr-un arbore n-ar

(defun nr(l k)
  (cond
     ((and (= k 0)(atom l)) 1)
     ((= k 0) 0)
     ((atom l) 0)
     (t(apply '+ (mapcar '(lambda (l) (nr l k)) l)))
  )
)
