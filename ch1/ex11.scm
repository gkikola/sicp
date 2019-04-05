;; Exercise 1.11
;;
;; f is defined by
;;   f(n) = n  for  n < 3
;;   f(n) = f(n - 1) + 2 * f(n - 2) + 3 * f(n - 3)  for  n >= 3
;;
;; (f-recursive n) computes f(n) using a recursive process, while
;; (f-iterative n) computes f(n) using an iterative process.

(define (f-recursive n)
  (cond
   ((< n 3) n)
   (else (+
          (f-recursive (- n 1))
          (* 2 (f-recursive (- n 2)))
          (* 3 (f-recursive (- n 3)))))))

(define (f-iterative n)
  (define (iter a b c count)
    (cond ((= count 0) c)
          (else (iter
                 (+ a (* 2 b) (* 3 c))
                 a
                 b
                 (- count 1)))))
  (iter 2 1 0 n))
