;; Exercise 1.28
;;
;; Miller-Rabin test for primality

;; Modified expmod, returns 0 if non-trivial square root of one (mod
;; m) is found.
(define (expmod base exp m)
  ;; Square x and take the result modulo m.
  (define (sq-mod x m)
    (remainder (square x) m))
  ;; If x is a non-trivial square root of 1 mod m return 0 otherwise
  ;; return (sq-mod x m)
  (define (test x m)
    (cond ((and (not (or (= x 1) (= x (- m 1))))
                (= (sq-mod x m) 1)) 0)
          (else (sq-mod x m))))
  (cond ((= exp 0) 1)
        ((even? exp) (test (expmod base (/ exp 2) m) m))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))

;; (miller-rabin n count) is true if the number n passes count
;; Miller-Rabin primality checks and false if the number was found to
;; be composite. Greater values for count will improve accuracy of the
;; test.
(define (miller-rabin n count)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (cond ((= count 0) true)
        ((not (try-it (+ 1 (random (- n 1))))) false)
        (else (miller-rabin n (- count 1)))))
