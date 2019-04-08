;; Exercise 1.41
;;
;; Doubling a procedure

;; Takes a predicate f of one argument and returns a procedure formed
;; by applying f to its argument twice.
(define (double f)
  (lambda (x) (f (f x))))
