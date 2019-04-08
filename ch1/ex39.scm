;; Exercise 1.39
;;
;; Continued fraction representation for tan

(load "../util/cont-frac.scm")

;; Compute an approximation for tan(x) using a k-term continued
;; fraction.
(define (tan-cf x k)
  (cont-frac (lambda (n) (if (= n 1) x (- (* x x))))
             (lambda (n) (- (* 2 n) 1))
             k))
