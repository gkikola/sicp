;; Exercise 1.33
;;
;; A filtered accumulator

(load "../util/prime.scm")
(load "../util/gcd.scm")
(load "../util/square.scm")

;; Evaluates (term n) for each n from a to b, using the predicate next
;; as an increment and combines the results using the predicate
;; combiner taking two arguments. The initial base value is specified
;; by null-value.
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

;; Same as accumulate above, except with a filter predicate taking one
;; argument specifying which terms to include in the accumulation.
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
