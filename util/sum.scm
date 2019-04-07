;; (sum term a next b) computes the sum of each term from a to b,
;; where term is a procedure taking the index of the term as a
;; parameter and returning the value of the term, and next is a
;; procedure which takes an index and returns the next index.
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
