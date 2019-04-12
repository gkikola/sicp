;; Exercise 2.8
;;
;; Interval arithmetic, continued

(load "ex07.scm")

;; Negation
(define (negate-interval i)
  (make-interval (- (upper-bound i)) (- (lower-bound i))))

;; Subtraction
(define (sub-interval i j)
  (add-interval i (negate-interval j)))
