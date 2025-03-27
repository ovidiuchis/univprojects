;L3.14)Definiti o functie care testeaza aparteneta unui nod intr-un arbore
;n-ar.

(defun apare(l e)
  (cond
       ((equal l e) t)
       (t(mapc '(lambda (l) (apare l e)) l))
  )
)
