;Se da un arbore binar reprezentat sub forma (radacina sub1 sub2)
;se cere numarul noduriloe din arbore

(defun nr(l)
  (cond
     ((null l) 0)
     (t(+ 1 (nr (cadr l))(nr (caddr l))))
  )
)
