;Sa se scrie o functie care danduse un arbore in forma 2),
;determina subsarborele stang a arborele.

(defun st(l nv nm)
  (cond
     ((null l) nil)
     ((= nv (+ 1 nm)) nil)
     (t(cons (car l)(cons (cadr l) (st (cddr l)(+ 1 nv)(+ nm (cadr l))))))
  )
)
(defun stanga(l)
 (st (cddr l) 0 0)
)
