;; Call the given procedure on each element of the list.
(define (for-each proc list)
  (cond ((null? list) #t)
        (else (proc (car list)) (for-each proc (cdr list)))))
