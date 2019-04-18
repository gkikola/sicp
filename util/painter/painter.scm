(load "../for-each.scm")
(load "../vector.scm")
(load "draw.scm")
(load "frame.scm")
(load "segment.scm")

;; Constructs a painter from a list of line segments. The line
;; segments should be within the unit square. When the resulting
;; painter is called with a frame, the segments are drawn relative to
;; that frame.
(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

;; Takes a painter and information on how to transform a frame and
;; returns a new painter that is a transformation of the original.
(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter
         (make-frame new-origin
                     (sub-vect (m corner1) new-origin)
                     (sub-vect (m corner2) new-origin)))))))
