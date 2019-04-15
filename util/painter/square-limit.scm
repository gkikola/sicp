(load "beside-below.scm")
(load "flip.scm")
(load "split.scm")

;; Takes a painter and produces a new painter using a recursive
;; pattern where the painter appears reduced in size the closer it
;; gets to the edge of the frame.
(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))
