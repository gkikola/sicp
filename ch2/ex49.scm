;; Exercise 2.49
;;
;; Segment painters

(load "../util/painter/painter.scm")
(load "../util/painter/segment.scm")

(define bl (make-vect 0.0 0.0))
(define br (make-vect 1.0 0.0))
(define tl (make-vect 0.0 1.0))
(define tr (make-vect 1.0 1.0))

(define (outline-painter)
  (segments->painter (list (make-segment bl br)
                           (make-segment br tr)
                           (make-segment tr tl)
                           (make-segment tl bl))))

(define (x-painter)
  (segments->painter (list (make-segment bl tr)
                           (make-segment br tl))))

(define (diamond-painter)
  (define (midpoint v1 v2)
    (make-vect (/ (+ (xcor-vect v1) (xcor-vect v2)) 2)
               (/ (+ (ycor-vect v1) (ycor-vect v2)) 2)))
  (let ((bottom (midpoint bl br))
        (top (midpoint tr tl))
        (left (midpoint tl bl))
        (right (midpoint br tr)))
    (segments->painter (list (make-segment bottom right)
                           (make-segment right top)
                           (make-segment top left)
                           (make-segment left bottom)))))
