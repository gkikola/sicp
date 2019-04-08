;; Exercise 1.44
;;
;; Smoothing functions

(load "ex43.scm")

(define dx 0.00001)

;; Smooth the function f.
(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

;; Perform an n-fold smoothing on f.
(define (n-fold-smooth f n)
  ((repeated smooth n) f))
