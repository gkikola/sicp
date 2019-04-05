;; Exercise 1.27
;;
;; (test-flt n) checks whether the conclusion of Fermat's Little
;; Theorem holds for the positive number n; that is, the procedure
;; checks whether a^n is congruent to a modulo n for all a < n. The
;; test should succeed for every prime number (by Fermat's Little
;; Theorem) but may also succeed for some composite numbers (namely,
;; the Carmichael numbers).
(load "../util/expmod.scm")

(define (test-flt n)
  (define (test a n)
    (= (expmod a n n) a))
  (define (iter a n)
    (cond ((or (> a n) (= a n)) #t)
          ((not (test a n)) #f)
          (else (iter (+ a 1) n))))
  (iter 2 n))
