;; Exercise 1.12
;;
;; Pascal's triangle: (binom n r) computes the coefficient of the x^r
;; term in the expansion of (x + y)^n, by means of a recursive
;; process.

(define (binom n r)
  (cond
   ((or (< r 0) (> r n)) 0)
   ((or (= r 0) (= r n)) 1)
   (else (+ (binom (- n 1) (- r 1)) (binom (- n 1) r)))))
