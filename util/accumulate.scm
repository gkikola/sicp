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
