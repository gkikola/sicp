;; Exercise 2.40
;;
;; unique-pairs

(load "../util/enumerate.scm")
(load "../util/flatmap.scm")
(load "../util/prime.scm")

;; Generate a list of pairs of integers i and j with 1 <= j < i <= n.
(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

;; Generate a list of unique pairs of integers i and j such that i + j
;; is prime.
(define (prime-sum-pairs n)
  (define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair))))
  (define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))
