;; Exercise 1.31
;;
;; A higher-order product procedure

;; Analogous to the sum procedure from Exercises 1.29-1.30, (product
;; term a next b) computes the product of a collection of terms
;; (obtained using the given term procedure) from a to b with next
;; taking an index and producing the next index in the sequence.
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

;; An iterative version of product
(define (product-it term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

;; A factorial function implemented using product
(define (factorial n)
  (define (ident x) x)
  (define (inc x) (+ x 1))
  (product ident 1 inc n))
