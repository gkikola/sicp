;; Exercise 1.18
;;
;; (mult a b) computes the product of a and b in Theta(log n) steps,
;; using an iterative process.

(define (double n) (* n 2))
(define (halve n) (/ n 2))
(define (even? n) (= (remainder n 2) 0))

(define (mult a b)
  (define (iter sum a b)
    (cond ((= b 0) sum)
          ((even? b) (iter sum (double a) (halve b)))
          (else (iter (+ sum a) a (- b 1)))))
  (if (< b 0)
      (- (iter 0 a (- b)))
      (iter 0 a b)))
