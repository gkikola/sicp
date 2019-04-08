;; Exercise 1.37
;;
;; Continued fractions

;; Compute the k-term finite continued fraction
;;
;; N_1 / (D_1 + N_2 / (... + N_k / D_k))
;;
;; where N_i is given by the predicate n and D_i is given by the
;; predicate d.
(define (cont-frac n d k)
  (define (part i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (part (+ i 1))))))
  (part 1))

;; Same as above but uses an iterative process.
(define (cont-frac-it n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))
