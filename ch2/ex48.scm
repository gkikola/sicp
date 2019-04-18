;; Exercise 2.48
;;
;; Directed line segments in the plane

(load "../util/vector.scm")

(define (make-segment start end)
  (list start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cadr segment))
