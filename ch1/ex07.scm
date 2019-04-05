;; Exercise 1.7
;;
;; Using Newton's method to compute square roots with better accuracy
;; for large and small numbers.

(define (sqrt-iter guess x)
  (define new-guess (improve guess x))
  (if (good-enough? guess new-guess)
      new-guess
      (sqrt-iter new-guess x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess new-guess)
  (< (abs (/ (- new-guess guess) guess)) 0.0001))

(define (sqrt x)
  (sqrt-iter 1.0 x))
