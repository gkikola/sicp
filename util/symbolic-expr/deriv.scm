(load "ops.scm")
(load "vars.scm")

;; Compute the derivative of the symbolic expression exp with respect
;; to var.
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((and (exponentiation? exp) (number? (exponent exp)))
         (make-product (make-product (exponent exp)
                                     (make-exponentiation
                                      (base exp) (- (exponent exp) 1)))
                       (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))
