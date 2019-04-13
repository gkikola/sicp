;; Exercise 2.20
;;
;; Parity, with an arbitrary number of arguments

;; Takes one or more integers and returns a list consisting of all the
;; given integers having the same even/odd parity as the first integer
;; in the sequence.
(define (same-parity first . rest)
  (let ((parity (remainder first 2)))
    (define (iter list)
      (cond ((null? list)
             '())
            ((= parity (remainder (car list) 2))
             (cons (car list) (iter (cdr list))))
            (else
             (iter (cdr list)))))
    (cons first (iter rest))))
