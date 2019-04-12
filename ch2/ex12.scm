;; Exercise 2.12
;;
;; Values with percent tolerances

(load "ex07.scm")

;; Construct interval with center c and (half) width w.
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

;; Get center of an interval.
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

;; Get (half) width of an interval.
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

;; Make an interval from a center and a percentage tolerance.
(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100))))

;; Get the percentage tolerance on an interval.
(define (percent i)
  (* (/ (width i) (center i)) 100))
