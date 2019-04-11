;; Exercise 2.1
;;
;; A better make-rat

(load "../util/gcd.scm")

;; Constructs a rational number from a given numerator n and
;; denominator d. The fraction is put into lowest terms with the
;; denominator always positive.
(define (make-rat n d)
  (let ((g (gcd n d))
        (sign (if (not (< (* n d) 0)) 1 -1)))
    (cons (* sign (abs (/ n g))) (abs (/ d g)))))
