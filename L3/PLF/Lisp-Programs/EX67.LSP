;L3.14)Definiti o functie care obtine dintr-o lista data lista tuturor
;atomilor care apar, pe orice nivel, dar in aceeasi ordine.

(defun lista(l)
   (cond
          ((atom l) (list l))
          (t(mapcan ' lista l))
  )
)
