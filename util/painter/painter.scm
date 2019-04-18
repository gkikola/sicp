(load "../for-each.scm")
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
