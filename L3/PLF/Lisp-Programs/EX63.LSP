;L3.10)Sa se scrie o functie care sterge toate aparitiile unui atom
;de la toate nivelurile unei liste.

(defun sterge(l e)
  (cond
       ((equal l e) nil)
       ((atom l) (list l))
       (t(mapcar '(lambda (l) (sterge l e)) l))
 )
)
