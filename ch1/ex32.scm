;; Exercise 1.32
;;
;; A general accumulate procedure

;; Evaluates (term n) for each n from a to b, using (next n) as an
;; increment and combines the results using (combiner k result) using
;; an initial base value of null-value.
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

;; An iterative version of accumulate.
(define (accumulate-it combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

;; Using accumulate to define sum and product
(define (sum term a next b) (accumulate + 0 term a next b))
(define (product factor a next b) (accumulate * 1 factor a next b))
