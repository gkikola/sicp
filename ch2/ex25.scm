;; Exercise 2.25
;;
;; Pick 7

(define x (list 1 3 (list 5 7) 9))
(define y (list (list 7)))
(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

;; Select 7 from each list.
(display (car (cdr (car (cdr (cdr x))))))
(newline)
(display (car (car y)))
(newline)
(display (cadr (cadr (cadr (cadr (cadr (cadr z)))))))
(newline)
