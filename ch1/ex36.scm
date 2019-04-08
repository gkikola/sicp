;; Exercise 1.36
;;
;; Modifying fixed-point to print each iteration

(define tolerance 0.00001)

;; Find fixed points for the function f by starting with first-guess
;; and repeatedly evaluating f at each guess.
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
