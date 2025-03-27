;L3.8)Definiti o functie care inverseaza o lista impreuna cu toate
;sublistele sale de pe orice nivel.
  
(defun invers(l)
   (cond
        ((atom l) (list l))
        (t(mapcan  'invers (list(reverse l))))
   )
)

