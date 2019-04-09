;; Takes a function f of one variable and produces the average-damped
;; function, which is the function formed by taking the average of x
;; and f(x) for each x.
(define (average-damp f)
  (define (average a b) (/ (+ a b) 2))
  (lambda (x) (average x (f x))))
