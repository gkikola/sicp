;; Exercise 2.36
;;
;; accumulate-n

(load "../util/accumulate.scm")

;; Like accumulate, but takes a sequence of sequences and uses the
;; procedure op to combine the first elements of each sequence, then
;; the second elements, and so on, and puts the results in a list.
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))
