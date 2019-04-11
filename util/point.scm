;; Construct a point from two coordinates.
(define (make-point x y)
  (cons x y))

;; Get the x-coordinate of a point.
(define (x-point pt)
  (car pt))

;; Get the y-coordinate of a point.
(define (y-point pt)
  (cdr pt))
