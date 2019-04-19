;; Exercise 2.54
;;
;; Testing equality

;; Test whether a and b are equal in the sense that they contain equal
;; elements arranged in the same order.
(define (equal? a b)
  (cond ((null? a) (null? b))
        ((pair? a) (and (pair? b)
                        (equal? (car a) (car b))
                        (equal? (cdr a) (cdr b))))
        (else (and (not (pair? b))
                   (eq? a b)))))
