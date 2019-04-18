(load "../vector.scm")

;; "Draw" a line segment.
(define (draw-line start end)
  (display "Drawing line from (")
  (display (xcor-vect start))
  (display ",")
  (display (ycor-vect start))
  (display ") to (")
  (display (xcor-vect end))
  (display ",")
  (display (ycor-vect end))
  (display ")")
  (newline))
