;; Exercise 1.27
;;
;; Fermat's Little Theorem

(load "../util/expmod.scm")

;; (test-flt n) checks whether the conclusion of Fermat's Little
;; Theorem holds for the positive number n; that is, the procedure
;; checks whether a^n is congruent to a modulo n for all a < n. The
;; test should succeed for every prime number (by Fermat's Little
;; Theorem) but may also succeed for some composite numbers (namely,
;; the Carmichael numbers).
(define (test-flt n)
  (define (test a n)
    (= (expmod a n n) a))
  (define (iter a n)
    (cond ((or (> a n) (= a n)) true)
          ((not (test a n)) false)
          (else (iter (+ a 1) n))))
  (iter 2 n))
