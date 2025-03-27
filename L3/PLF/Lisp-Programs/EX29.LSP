;Sa se defineasca o functie care avand ca parametru o lista neliniara sa
;returneze lista atomilor din lista(de la orice nivel).

(defun atomi(l)
   (cond
      ((atom l)(list l))
      (t(mapcan 'atomi l))
  )
)
