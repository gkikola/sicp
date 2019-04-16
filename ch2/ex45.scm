;; Exercise 2.45
;;
;; Higher-order split

;; Takes two operations, each taking one painter and returning a new
;; painter, and produces a procedure that can be called with a painter
;; and an integer to perform the two operations on the given painter
;; in a recursive manner to form a split pattern.
(define (split first-op second-op)
  (define (do-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (do-split painter (- n 1))))
          (first-op painter (second-op smaller smaller)))))
  do-split)
