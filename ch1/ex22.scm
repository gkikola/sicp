;; Exercise 1.22
;;
;; (search-for-primes low hi) checks every odd integer between low and
;; hi (inclusive) for primality. Asterisks and test runtime are
;; printed next to the integers that have been found to be prime.
(load "../util/prime.scm")

(define (search-for-primes low hi)
  (define start
    (if (divides? 2 low) (+ low 1) low))
  (define (iter n)
    (if (or (< n hi) (= n hi)) (timed-prime-test n))
    (iter (+ n 2)))
  (iter start))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
