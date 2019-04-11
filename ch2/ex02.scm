;; Exercise 2.2
;;
;; Points, line segments, and midpoints

;; Construct a line segment from two points.
(define (make-segment start-pt end-pt)
  (cons start-pt end-pt))

;; Select the first point in a line segment.
(define (start-segment seg)
  (car seg))

;; Select the second point in a line segment.
(define (end-segment seg)
  (cdr seg))

;; Construct a point from two coordinates.
(define (make-point x y)
  (cons x y))

;; Get the x-coordinate of a point.
(define (x-point pt)
  (car pt))

;; Get the y-coordinate of a point.
(define (y-point pt)
  (cdr pt))

;; Takes a line segment and returns the midpoint of the segment.
(define (midpoint-segment segment)
  (let ((start (start-segment segment))
        (end (end-segment segment)))
    (make-point (/ (+ (x-point start) (x-point end)) 2)
                (/ (+ (y-point start) (y-point end)) 2))))

;; Prints the coordinates of a point.
(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))
