;; Exercise 2.32
;;
;; Power sets

;; Returns the set of all subsets of the given set.
(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (subset)
                            (cons (car s) subset)) rest)))))
