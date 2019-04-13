;; Exercise 2.29
;;
;; Binary mobiles

;; Construct a binary mobile from  two branches.
(define (make-mobile left right)
  (list left right))

;; Construct a branch of a mobile.
(define (make-branch length structure)
  (list length structure))

;; Select branches in a mobile.
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cadr mobile))

;; Get length/structure of a branch.
(define (branch-length branch) (car branch))
(define (branch-structure branch) (cadr branch))

;; Get the total weight of a mobile (assuming rods are weightless).
(define (total-weight mobile)
  (define (branch-weight branch)
    (let ((struct (branch-structure branch)))
      (if (pair? struct)
          (total-weight struct)
          struct)))
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

;; Determine if a binary mobile is balanced. A mobile is balanced if
;; each branch applies the same torque and each submobile is balanced.
(define (balanced? mobile)
  (define (branch-torque branch)
    (let ((length (branch-length branch))
          (struct (branch-structure branch)))
      (if (pair? struct)
          (* length (total-weight struct))
          (* length struct))))
  (define (branch-balanced? branch)
    (let ((struct (branch-structure branch)))
      (or (not (pair? struct))
          (balanced? struct))))
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (= (branch-torque left) (branch-torque right))
         (branch-balanced? left)
         (branch-balanced? right))))
