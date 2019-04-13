;; Exercise 2.18
;;
;; Reversing a list

;; Takes a list and returns a list of the same elements in reverse
;; order.
(define (reverse list)
  (define (iter list result)
    (if (null? list)
        result
        (iter (cdr list) (cons (car list) result))))
  (iter list '()))
