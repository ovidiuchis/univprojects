;Determinati lungimea celei mai scurte subliste dintr-o lista liniara,
;lungimea se calculeaza la nivel superficial, dar prelucrarea se face la
;orice nivel.

(defun lgm(l)
 (cond
    ((atom l) 0)
    (t(max (length l) (apply 'max (mapcar 'lgm l))))
)
)
