;; Exercise 2.34
;;
;; Evaluating polynomials

;; Use Horner's rule to evaluate the polynomial with the given
;; coefficients (in order of ascending powers) at x.
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))
