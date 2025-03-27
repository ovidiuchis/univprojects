;L2.10)Sa se decida daca un arbore de tipul (2) este echilibrat.

(defun adancime(arb)
  (cond
        ((null arb) -1)        
        ((null (cdr arb)) 0)
        (t(+ 1 (max ( stang (cadr arb)) (stang (caddr arb)))))
 )
)

(defun test(arb)
  (cond
       ((null arb) nil)
       ((<= (abs(- (adancime (cadr arb)) (adancime (caddr arb)))) 1)t)
       (t nil)
 )
)  
