;; Exercise 1.40
;;
;; Roots of the monic cubic

(load "../util/newtons-method.scm")

;; Returns a procedure representing the monic cubic polynomial
;; function defined by f(x) = x^3 + ax^2 + bx + c.
(define (cubic a b c)
  (lambda (x)
    (+ (* x x x) (* a x x) (* b x) c)))
