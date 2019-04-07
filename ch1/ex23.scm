;; Exercise 1.23
;;
;; A more efficient smallest-divisor

;; For positive integers n, (smallest-divisor n) computes the smallest
;; integer greater than 1 that divides n. When testing for
;; divisibility, no even numbers other than 2 are checked.
(define (smallest-divisor n)
  (define (next n)
    (if (= n 2) 3 (+ n 2)))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor)))))
  (find-divisor n 2))

(define (divides? a b)
  (= (remainder b a) 0))
