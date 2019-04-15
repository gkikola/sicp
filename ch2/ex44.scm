;; Exercise 2.44
;;
;; Picture language, up-split

(load "../util/painter/beside-below.scm")

;; Produces a painter that takes a given painter and splits it and
;; branches toward the top of the frame.
(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))
