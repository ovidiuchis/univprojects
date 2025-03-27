;7.b)Sa se scrie o functie care intoarece multimea tuturor sublistelor
;unei liste date.

(defun subm(l)
  (cond
     ((null l) nil)
     ((listp (car l))(append (car l) (list(subm (car l))(subm (cdr l)))))
     (t(subm(cdr l))) 
 )
)
