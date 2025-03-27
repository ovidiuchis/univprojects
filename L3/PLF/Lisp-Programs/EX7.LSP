;Sa se defineasca o functie care sa determine lista atomilor
;nenumerici de la orice nivel dintr-o lista neliniara.
;a)fara a pastra structura sublistelor

(defun lis(l)
  (cond
     ((null l) nil)
     ((not(numberp (car l)))(cons (car l) (lis (cdr l))))
     ((listp (car l))(append (lis (car l)) (lis (cdr l))))
     (t(lis (cdr l))) 
  )
) 

;b)cu pastrerea structurii sublistelor

(defun lis1(l)
   (cond
        ((null l) nil)
        ((not(numberp (car l)))(cons (car l)(lis1 (cdr l))))
        ((atom (car l))(lis1 (cdr l)))
        (t(cons (lis1 (car l))(lis1 (cdr l))))
   )
)  
