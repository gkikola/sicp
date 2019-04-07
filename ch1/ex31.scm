;; Exercise 1.31
;;
;; A higher-order product procedure

;; Analogous to the sum procedure from Exercises 1.29-1.30, (product
;; term a next b) computes the product of a collection of factors
;; (obtained using the given factor procedure) from a to b with next
;; taking an index and producing the next index in the sequence.
(define (product factor a next b)
  (if (> a b)
      1
      (* (factor a) (product factor (next a) next b))))

;; An iterative version of product
(define (product-it factor a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (factor a) result))))
  (iter a 1))

;; A factorial function implemented using product
(define (factorial n)
  (define (ident x) x)
  (define (inc x) (+ x 1))
  (product ident 1 inc n))

;; Approximation of pi using a formula by Wallis. n is the number of
;; iterations, higher values of n produce better accuracy.
(define (pi n)
  (define (add2 x) (+ x 2))
  (define (seq n) (/
                   (* n (+ n 2))
                   (* (+ n 1) (+ n 1))))
  (* 4.0 (product seq 2 add2 (* n 2))))
