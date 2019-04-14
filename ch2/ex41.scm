;; Exercise 2.41
;;
;; Triples with a given sum

(load "../util/enumerate.scm")
(load "../util/flatmap.scm")

;; Finds all ordered triples of distinct positive integers i, j, k
;; less than or equal to n such that i + j + k = s.
(define (unique-triples-with-sum n s)
  (filter (lambda (triple)
            (= (+ (car triple) (cadr triple) (caddr triple)) s))
          (flatmap (lambda (i)
                 (flatmap (lambda (j)
                        (map (lambda (k)
                               (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
               (enumerate-interval 1 n))))
