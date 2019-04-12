;; Exercise 2.11
;;
;; Interval arithmetic, continued

(load "ex07.scm")

;; Negation
(define (negate-interval i)
  (make-interval (- (upper-bound i)) (- (lower-bound i))))

;; Modified multiplication
(define (mul-interval i j)
  (define (only-positive? i)
    (> (lower-bound i) 0))
  (define (only-negative? i)
    (< (upper-bound i) 0))
  (define (contains-zero? i)
    (not (or (only-positive? i) (only-negative? i))))
  (cond ((only-positive? i)
         (cond ((only-positive? j)
                (make-interval (* (lower-bound i) (lower-bound j))
                               (* (upper-bound i) (upper-bound j))))
               ((only-negative? j)
                (make-interval (* (upper-bound i) (lower-bound j))
                               (* (lower-bound i) (upper-bound j))))
               ((contains-zero? j)
                (make-interval (* (upper-bound i) (lower-bound j))
                               (* (upper-bound i) (upper-bound j))))))
        ((only-negative? i)
         (negate-interval (mul-interval (negate-interval i) j)))
        ((contains-zero? i)
         (cond ((only-positive? j)
                (mul-interval j i))
               ((only-negative? j)
                (negate-interval (mul-interval (negate-interval j) i)))
               ((contains-zero? j)
                (make-interval (min
                                (* (upper-bound i) (lower-bound j))
                                (* (lower-bound i) (upper-bound j)))
                               (max
                                (* (lower-bound i) (lower-bound j))
                                (* (upper-bound i) (upper-bound j)))))))))
