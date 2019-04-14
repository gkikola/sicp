;; Exercise 2.30
;;
;; Squaring trees

(load "../util/square.scm")

;; Square the leaves of a tree.
(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (expt tree 2))
        (else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

;; Alternate implementation using map.
(define (square-tree tree)
  (map (lambda (branch)
         (if (pair? branch)
             (square-tree branch)
             (expt branch 2)))
       tree))
