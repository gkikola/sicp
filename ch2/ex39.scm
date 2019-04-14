;; Exercise 2.39
;;
;; Reverse in terms of fold-left and fold-right

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op (car rest) result)
              (cdr rest))))
  (iter initial sequence))

;; reverse using fold-right.
(define (reverse sequence)
  (fold-right (lambda (x y) (cons x y)) '() sequence))

;; reverse using fold-left.
(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))
