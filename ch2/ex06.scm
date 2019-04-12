;; Exercise 2.6
;;
;; Defining nonnegative integers as lambda expressions

;; The integer 0.
(define zero (lambda (f) (lambda (x) x)))

;; Adds one to the given integer.
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; Subtracts one from the given integer (but returns zero on zero).
(define (sub-1 n)
  (lambda (f) (lambda (x) (((n (lambda (g) (lambda (h) (h (g f)))))
                            (lambda (u) x))
                           (lambda (u) u)))))

;; The integer 1.
(define one (lambda (f) (lambda (x) (f x))))

;; The integer 2.
(define two (lambda (f) (lambda (x) (f (f x)))))

;; Addition between integers
(define (plus a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

;; The boolean value true
(define (true x) (lambda (y) x))

;; The boolean value false
(define (false x) (lambda (y) y))

;; Determines if a number is zero
(define (is-zero? n)
  ((n (lambda (x) false)) true))

;; If x? is true, then on-true, else on-false
(define (if-then-else x? on-true on-false)
  ((x? on-true) on-false))

;; Print the number n to the screen
(define (print-int n)
  (define (helper num count)
    (if (if-then-else (is-zero? num) #t #f)
        (display count)
        (helper (sub-1 num) (+ count 1))))
  (helper n 0)
  (newline))
