(define dx 0.00001)

;; Takes a function g and returns a procedure that approximates the
;; derivative g' of g.
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))
