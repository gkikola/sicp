;; Exercise 2.21
;;
;; Squaring elements in a list

(load "../util/square.scm")

;; Squares each element in the given list.
(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items)) (square-list (cdr items)))))

;; Alternate implementation using map.
(define (square-list items)
  (map square items))
