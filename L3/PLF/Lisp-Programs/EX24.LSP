;Se da o lista liniara. Se cere o lista liniara cu toti atomii din lista.

(defun atomi(l)
  (cond
     ((atom l) (list l))
     (t(apply 'append (mapcar 'atomi l)))
  )
)
