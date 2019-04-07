;; Computes the greatest common divisor of a and b using Euclid's
;; algorithm.
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
