;; Exercise 2.17
;;
;; last-pair

;; Returns a list consisting of only the last element of a given
;; nonempty list.
(define (last-pair list)
  (cond ((null? list) (error "last-pair called on empty list"))
        ((null? (cdr list)) list)
        (else (last-pair (cdr list)))))
