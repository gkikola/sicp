;; Exercise 1.43
;;
;; Repeated applications of a function

;; Composes f with itself n times. That is, it returns the function
;;
;; x -> f(f(...(f(x)))),
;;
;; where there are n applications of f.
(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (lambda (x) (f ((repeated f (- n 1)) x)))))
