;Sa se determine lungimea unei liste la nivel superficial.(iretativ)

(defun lungime(l)
  (prog ((lista l) (lg 0))
     et
        (cond
            ((null lista) (return lg))
            (t(setq lg (+ lg 1))
              (setq lista (cdr lista)))
        )
       (go et)
    )
)
