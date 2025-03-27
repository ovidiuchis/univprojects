;Inversarea unei liste la nivel superifical

(defun invers(lista)
   (do
        ((l lista (cdr l))
        (result nil)
        )
       ((null l) result)
       (setf result (cons (car l) result))
   )
)  
