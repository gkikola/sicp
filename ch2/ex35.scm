;; Exercise 2.35
;;
;; Counting leaves as an accumulation

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) (if (pair? x)
                                       (count-leaves x)
                                       1)) t)))
