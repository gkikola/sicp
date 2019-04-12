;; Exercise 2.10
;;
;; Interval arithmetic, continued

(load "ex07.scm")

;; Modified division
(define (div-interval i j)
  (if (and (< (lower-bound j) 0) (> (upper-bound j) 0))
      (error "Potential division by 0"))
  (mul-interval i
                (make-interval (/ 1.0 (upper-bound j))
                               (/ 1.0 (lower-bound j)))))
