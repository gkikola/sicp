;; Exercise 1.8
;;
;; Using Newton's method to find cube roots.

(define (cbrt-iter guess x)
  (define new-guess (improve guess x))
  (if (good-enough? guess new-guess)
      new-guess
      (cbrt-iter new-guess x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3)) ; (x / guess^2 + 2 * guess) / 3

(define (good-enough? guess new-guess)
  (< (abs (/ (- new-guess guess) guess)) 0.0001))

(define (cbrt x) (cbrt-iter 1.0 x))
