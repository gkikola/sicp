;; Exercise 1.17
;;
;; (mult a b) computes the product of a and b in Theta(log n) steps,
;; using a recursive process.

(define (double n) (* n 2))
(define (halve n) (/ n 2))
(define (even? n) (= (remainder n 2) 0))

(define (mult a b)
  (cond ((< b 0) (- (mult a (- b))))
        ((= b 0) 0)
        ((even? b) (mult (double a) (halve b)))
        (else (+ a (mult a (- b 1))))))
