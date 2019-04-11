;; Exercise 2.3
;;
;; Rectangles

(load "../util/point.scm")

;; Constructs a rectangle from two points as diagonal vertices.
(define (make-rect upper-left lower-right)
  (cons upper-left lower-right))

;; Gets the upper-left corner of a rectangle
(define (upper-left-rect rect)
  (car rect))

;; Gets the upper-right corner of a rectangle
(define (upper-right-rect rect)
  (make-point (x-point (lower-right-rect rect))
              (y-point (upper-left-rect rect))))

;; Gets the lower-left corner of a rectangle
(define (lower-left-rect rect)
  (make-point (x-point (upper-left-rect rect))
              (y-point (lower-right-rect rect))))

;; Gets the lower-right corner of a rectangle
(define (lower-right-rect rect)
  (cdr rect))

;; Gets the width of a rectangle
(define (width-rect rect)
  (abs (- (x-point (lower-right-rect rect)) (x-point (upper-left-rect rect)))))

;; Gets the height of a rectangle
(define (height-rect rect)
  (abs (- (y-point (upper-left-rect rect)) (y-point (lower-right-rect rect)))))

;; Gets the area of a rectangle
(define (area-rect rect)
  (* (width-rect rect) (height-rect rect)))
