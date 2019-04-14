;; Exercise 2.31
;;
;; Tree map

;; Apply the procedure to each leaf in the tree.
(define (tree-map proc tree)
  (map (lambda (branch)
         (if (pair? branch)
             (tree-map proc branch)
             (proc branch)))
       tree))
