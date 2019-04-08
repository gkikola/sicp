;; Exercise 1.38
;;
;; Euler's continued fraction expansion for e - 2

(load "../util/cont-frac.scm")

;; Approximate the base of the natural logarithm, e, using a continued
;; fraction with n terms.
(define (approx-e n)
  (define (denom i)
    (if (= (remainder i 3) 2)       ; if (i/3) % 3 == 2
        (* 2.0 (+ 1 (/ (- i 2) 3))) ; then 2 * (1 + (i - 2) / 3)
        1.0))                       ; else 1
  (+ 2 (cont-frac (lambda (x) 1)
                  denom
                  n)))
