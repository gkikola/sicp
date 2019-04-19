;; Exercise 2.57
;;
;; Sums and products of more than two terms

(load "../util/symbolic-expr/deriv.scm")
(load "../util/symbolic-expr/ops.scm")
(load "../util/symbolic-expr/vars.scm")

;; New selectors.
(define (augend s)
  (define (sum-list list)
    (if (null? list)
        0
        (make-sum (car list) (sum-list (cdr list)))))
  (sum-list (cddr s)))
(define (multiplicand p)
  (define (prod-list list)
    (if (null? list)
        1
        (make-product (car list) (prod-list (cdr list)))))
  (prod-list (cddr p)))
