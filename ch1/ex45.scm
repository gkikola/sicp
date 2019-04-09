;; Exercise 1.45
;;
;; Computing nth roots

(load "../util/average-damp.scm")
(load "../util/fixed-point.scm")
(load "../util/repeated.scm")

;; Compute the nth root of x using a fixed-point procedure with
;; repeated average damping.
(define (nth-root n x)
  ;; Every time the index of the radical is doubled, we need to add an
  ;; extra damping factor.
  (let ((damp-count (floor (/ (log n) (log 2)))))
    (fixed-point ((repeated average-damp damp-count)
                  (lambda (y) (/ x (expt y (- n 1))))) 1.0)))
