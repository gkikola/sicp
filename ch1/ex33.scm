;; Exercise 1.33
;;
;; A filtered accumulator

(load "../util/accumulate.scm")
(load "../util/prime.scm")
(load "../util/gcd.scm")
(load "../util/square.scm")

;; Same as accumulate from Exercise 1.32, except with a filter
;; predicate taking one argument specifying which terms to include in
;; the accumulation.
(define (filtered-accumulate combiner null-value term a next b filter)
  (define (filtered-term n)
    (if (filter n) (term n) null-value))
  (accumulate combiner null-value filtered-term a next b))

;; Some useful functions.
(define (ident x) x)
(define (inc n) (+ n 1))

;; Sum of the squares of prime numbers from a to b.
(define (sum-squared-primes a b)
  (filtered-accumulate + 0 square a inc b prime?))

;; Product of integers less than n that are relatively prime to n.
(define (prod-totatives n)
  (define (relprime? i)
    (= (gcd i n) 1))
  (filtered-accumulate * 1 ident 1 inc n relprime?))
