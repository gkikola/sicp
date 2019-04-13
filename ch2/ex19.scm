;; Exercise 2.19
;;
;; Counting change

;; Common coin denominations
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

;; Takes an amount of money and a list of all denominations of that
;; money and returns the number of ways to make change with the given
;; amount. The ordering of the list of denominations does not matter.
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

;; Returns the first denomination in a list of coin denominations.
(define (first-denomination coin-values)
  (car coin-values))

;; Takes a list of coin denominations and returns the list without the
;; first element.
(define (except-first-denomination coin-values)
  (if (no-more? coin-values)
      '()
      (cdr coin-values)))

;; Determines whether a list of coin values is the empty list.
(define (no-more? coin-values)
  (null? coin-values))
