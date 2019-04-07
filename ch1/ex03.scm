;; Exercise 1.3
;;
;; Sum of largest two squares

;; sum-of-largest-two-squares takes three numbers and returns the sum
;; of the squares of the largest two among them.
(define (sum-of-largest-two-squares a b c)
  (cond
   ((and (< a b) (< a c)) (+ (* b b) (* c c)))
   ((< b c) (+ (* a a) (* c c)))
   (else (+ (* a a) (* b b)))))
