(load "../vector.scm")
(load "frame.scm")
(load "painter.scm")

;; Produces a painter consisting of the first painter's image on the
;; left and the second painter's image on the right.
(define (beside left right)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
           (transform-painter left
                              (make-vect 0.0 0.0)
                              split-point
                              (make-vect 0.0 1.0)))
          (paint-right
           (transform-painter right
                              split-point
                              (make-vect 1.0 0.0)
                              (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

;; Produces a painter consisting of the first painter's image below
;; the second painter's image.
(define (below bottom top)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-bottom
           (transform-painter bottom
                              (make-vect 0.0 0.0)
                              (make-vect 1.0 0.0)
                              split-point))
          (paint-top
           (transform-painter top
                              split-point
                              (make-vect 1.0 0.5)
                              (make-vect 0.0 1.0))))
      (lambda (frame)
        (paint-bottom frame)
        (paint-top frame)))))
