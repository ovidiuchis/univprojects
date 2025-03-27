;Sa se defineasca o functie care sa determine suma atomilor
;numerici dontr-o lista neliniara:
;a) la nivel superficial.

(defun suma (l)
  (cond
      ((null l) 0)
      ((numberp (car l))(+ (car l) (suma (cdr l))))
      (t(suma (cdr l)))
  )
) 

;b) la orice nivel

(defun suma(l)
  (cond
     ((null l) 0)
     ((numberp (car l))(+ (car l)(suma (cdr l))))
     ((listp (car l))(+ (suma (car l))(suma (cdr l))))
     (t(suma (cdr l)))
   )
)
