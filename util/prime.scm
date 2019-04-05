;; (prime? n) tests whether n is prime for integers n > 1.
(define (prime? n)
  (= n (smallest-divisor n)))

;; For n > 1, (smallest-divisor n) computes the smallest integer
;; greater than 1 that divides n.
(define (smallest-divisor n)
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (find-divisor n 2))

;; (divides? a b) tests whether a divides b (i.e., that there exists
;; an integer c such that a * c = b).
(define (divides? a b)
  (= (remainder b a) 0))
