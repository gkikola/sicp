;; Exercise 1.42
;;
;; Function composition

;; Composes functions f and g to produce x -> f(g(x)).
(define (compose f g)
  (lambda (x) (f (g x))))
