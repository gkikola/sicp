;; Exercise 2.28
;;
;; Fringe

;; Takes a tree and returns a list of all the leaves of the tree in
;; order from left to right.
(define (fringe tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (cons tree '()))
        (else (append (fringe (car tree)) (fringe (cdr tree))))))
