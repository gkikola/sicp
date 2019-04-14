(load "accumulate.scm")

;; Calls proc on each element in seq to generate a list of lists,
;; which are then appended to one another to form a single list.
(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))
