;Sa se modifice o lista astfel:atomii nemumerici raman nemodificatii,
;iar cei numerici isi deupleaza valoarea. Modificarea se face la orice
;nivel.

(defun modif(l)
  (cond
    ((numberp l)(* 2 l))
    ((atom l) l)
    (t(mapcar 'modif l))
  )
)
