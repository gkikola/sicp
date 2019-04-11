;; Exercise 2.5
;;
;; Representing pairs of nonnegative integers

;; Makes a pair from the given two integers. The integers must be
;; nonnegative.
(define (cons a b)
  (if (or (< a 0) (< b 0)) (error "Integers must be nonnegative" a b))
  (* (expt 2 a) (expt 3 b)))

;; Selects the first integer from an integer pair
(define (car pair)
  (if (not (= (remainder pair 2) 0))
      0
      (+ 1 (car (/ pair 2)))))

;; Selects the second integer from an integer pair
(define (cdr pair)
  (if (not (= (remainder pair 3) 0))
      0
      (+ 1 (cdr (/ pair 3)))))
