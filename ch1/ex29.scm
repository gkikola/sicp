;; Exercise 1.29
;;
;; Simpson's Rule

(load "../util/sum.scm")

;; (integral f a b n) uses Simpson's Rule to approximate the value of
;; the definite integral of the function f from a to b, using n
;; subintervals.
(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (coefficient i)
    (cond ((= i 0) 1)
          ((= i n) 1)
          ((= (remainder i 2) 0) 2)
          (else 4)))
  (define (term i)
    (* (coefficient i)
       (f (+ a (* i h)))))
  (define (next i) (+ i 1))
  (* (/ h 3.0) (sum term 0 next n)))
