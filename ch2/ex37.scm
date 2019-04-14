;; Exercise 2.37
;;
;; Vector and matrix operations

(load "ex36.scm")

;; Dot product between two vectors.
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;; Matrix times (column) vector.
(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

;; Matrix transpose.
(define (transpose mat)
  (accumulate-n (lambda (x y) (cons x y)) '() mat))

;; Matrix times matrix.
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (map (lambda (col)
                  (dot-product row col)) cols)) m)))
