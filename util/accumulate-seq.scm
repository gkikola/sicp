;; Calls op on each term in the sequence, using initial as the initial
;; value of the result. op should take two arguments, one for the
;; current value in the sequence and one for the current result.
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
