;Se da o lista neliniara, se cere numarul de subliste incluzand lista,
;avand lungimea nr par.

(defun par(l)
  (cond
    ((= 0 (mod (length l) 2))t)
    (t nil)
  )
)
(defun nr(l)
  (cond
     ((atom l) 0)
     ((listp l)(apply '+ (par l) (+ 1 (mapcar 'nr l))))
     (t (apply '+ (mapcar 'nr l)))
  )
)
