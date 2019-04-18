;; Exercise 2.46
;;
;; Vectors

;; Constructor and selectors.
(define (make-vect x y) (list x y))
(define (xcor-vect v) (car v))
(define (ycor-vect v) (cadr v))

;; Vector addition.
(define (add-vect v w)
  (make-vect (+ (xcor-vect v) (xcor-vect w))
             (+ (ycor-vect v) (ycor-vect w))))

;; Scalar multiplication.
(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))

;; Vector subtraction.
(define (sub-vect v w)
  (add-vect v (scale-vect w -1)))
