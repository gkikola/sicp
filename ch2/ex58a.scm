;; Exercise 2.58a
;;
;; Differentiation with infix notation

(load "../util/symbolic-expr/deriv.scm")
(load "../util/symbolic-expr/vars.scm")

;; Constructors.
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2) (+ a1 a2)))
        (else (list a1 '+ a2))))
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))
(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        ((and (number? b) (number? e) (expt b e)))
        (else (list b '** e))))

;; Predicates.
(define (=number? exp num)
  (and (number? exp) (= exp num)))
(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))
(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))
(define (exponentiation? x)
  (and (pair? x) (eq? (cadr x) '**)))

;; Selectors.
(define (addend s) (car s))
(define (augend s) (caddr s))
(define (multiplier p) (car p))
(define (multiplicand p) (caddr p))
(define (base e) (car e))
(define (exponent e) (caddr e))
