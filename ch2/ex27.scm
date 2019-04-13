;; Exercise 2.27
;;
;; Deep reverse

;; Reverse all of the elements in the given list, and reverse all
;; elements in any sublists.
(define (deep-reverse list)
  (define (iter list result)
    (cond ((null? list) result)
          ((pair? list) (iter (cdr list) (cons (iter (car list) '()) result)))
          ((null? result) list)
          (else (cons list result))))
  (iter list '()))
