;; Exercise 2.7
;;
;; Interval arithmetic

;; Make an interval
(define (make-interval a b)
  (cons a b))

;; Selectors
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

;; Print an interval in the form:
;; (lower, upper) = midpoint +/- tolerance.
(define (print-interval i)
  (display "[")
  (display (lower-bound i))
  (display ", ")
  (display (upper-bound i))
  (display "] = ")
  (display (/ (+ (lower-bound i) (upper-bound i)) 2.0))
  (display " +/- ")
  (display (/ (- (upper-bound i) (lower-bound i)) 2.0))
  (newline))

;; Add
(define (add-interval i j)
  (make-interval (+ (lower-bound i) (lower-bound j))
                 (+ (upper-bound i) (upper-bound j))))

;; Multiply
(define (mul-interval i j)
  (let ((p1 (* (lower-bound i) (lower-bound j)))
        (p2 (* (lower-bound i) (upper-bound j)))
        (p3 (* (upper-bound i) (lower-bound j)))
        (p4 (* (upper-bound i) (upper-bound j))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

;; Divide
(define (div-interval i j)
  (mul-interval i
                (make-interval (/ 1.0 (upper-bound j))
                               (/ 1.0 (lower-bound j)))))
