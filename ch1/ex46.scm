;; Exercise 1.46
;;
;; A generalization of iterated-improvement processes

;; Takes two procedures:
;;   good-enough? takes two arguments - the current guess and the
;;     previous one - and determines whether the current guess is
;;     good enough.
;;   iter should take a guess and return a better guess through some
;;     sort of iterative process.
;;
;; Returns a procedure that can be called with a guess to carry out
;; repeated iterations of iter until good-enough? is satisfied.
(define (iterative-improve good-enough? iter)
  (define (proc guess)
    (let ((next (iter guess)))
      (if (good-enough? next guess)
          next
          (proc next))))
  proc)

;; Typical good-enough? procedure
(define (good-enough? next current)
  (< (abs (- next current)) 0.00001))

;; Redefining sqrt using iterative-improve
(define (sqrt x)
  (define (iter guess)
    (define (average a b) (/ (+ a b) 2))
    (average guess (/ x guess)))
  ((iterative-improve good-enough? iter) 1.0))

;; Redefining fixed-point
(define (fixed-point f guess)
  ((iterative-improve good-enough?
                      (lambda (x) (f x))) guess))
