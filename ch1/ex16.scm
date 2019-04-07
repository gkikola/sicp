;; Exercise 1.16
;;
;; A fast iterative exponentiation procedure

;; Some useful functions.
(define (even? n) (= (remainder n 2) 0))
(define (square n) (* n n))

;; (expt b n) computes b^n using an iterative process, with the number
;; of steps on the order of log(n). n must be nonnegative.
;;
;; Within each iteration, a*b^n remains invariant.
(define (expt b n)
  (define (iter a b n)
    (cond
     ((= n 0) a)
     ((even? n) (iter a (square b) (/ n 2)))
     (else (iter (* a b) b (- n 1)))))
  (iter 1 b n))
