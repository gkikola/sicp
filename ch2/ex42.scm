;; Exercise 2.42
;;
;; Solving the eight-queens puzzle

(load "../util/accumulate.scm")
(load "../util/enumerate.scm")
(load "../util/flatmap.scm")

;; Produces a list of lists of board positions in which each sublist
;; is a solution to the queens puzzle consisting of valid positions to
;; place n queens on an n-by-n chessboard in such a way that no queen
;; is in check.
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

;; Position constructor.
(define (position row col) (list row col))

;; Row/column selectors for positions.
(define (pos-row pos) (car pos))
(define (pos-col pos) (cadr pos))

;; Adjoins a new row-column position to a set of positions.
(define (adjoin-position row col positions)
  (append positions (list (position row col))))

;; An empty set of board positions.
(define empty-board '())

;; Determines whether a queen in the kth column is safe with respect
;; to the other queens in the position list. The queens in the first
;; k-1 columns are assumed to be safe with respect to each other.
(define (safe? col positions)
  (define (safe-pair? first second)
    (not (or (= (pos-row first) (pos-row second))
             (= (pos-col first) (pos-col second))
             (= (abs (- (pos-row first) (pos-row second)))
                (abs (- (pos-col first) (pos-col second)))))))
  (define (safe-or-equal-pair? first second)
    (or (safe-pair? first second)
        (and (= (pos-row first) (pos-row second))
             (= (pos-col first) (pos-col second)))))
  (let ((last-pos (list-ref positions (- col 1))))
    (accumulate (lambda (p q) (and p q))
                #t
                (map (lambda (pos)
                       (safe-or-equal-pair? pos last-pos))
                     positions))))

;; Prints a list of queen positions as an ASCII drawing of queens on a
;; chess board. Useful for debugging and for viewing solutions to the
;; queens problem.
(define (print-board solution)
  (define (in-solution? pos)
    (accumulate (lambda (p q) (or p q))
                #f
                (map (lambda (p)
                       (and (= (pos-row pos) (pos-row p))
                            (= (pos-col pos) (pos-col p))))
                     solution)))
  (let ((board-size (length solution)))
    (for-each (lambda (row)
                (for-each (lambda (col)
                            (if (in-solution? (position row col))
                                (display "Q")
                                (display ".")))
                          (enumerate-interval 1 board-size))
                (newline))
              (enumerate-interval 1 board-size))
    (newline)))

;; Prints all the solutions in a sequence of solutions.
(define (print-all solutions)
  (for-each print-board solutions))
