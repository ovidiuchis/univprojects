;Sa se defineasca o funtie care avand ca paramtru o lista neliniara
;returneaza lista atomilor care apar pe orice nivel, dar in ordine inversa.

(defun invers(l)
   (cond
         ((atom l)(list l))
         (t(mapcan 'invers (reverse l)))
  )
)
