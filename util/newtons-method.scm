(load "deriv.scm")
(load "fixed-point.scm")

;; Performs Newton's method to find the zeroes of the function g
;; starting with initial guess guess.
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))
