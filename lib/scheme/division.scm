
(define truncate-quotient quotient)
(define truncate-remainder remainder)
(define (truncate/ n m)
  (values (truncate-quotient n m) (truncate-remainder n m)))

(define floor-remainder modulo)
(define (floor-quotient n m)
  (quotient (- n (floor-remainder n m)) m))
(define (floor/ n m)
  (values (floor-quotient n m) (floor-remainder n m)))

(define (round-quotient n m)
  (inexact->exact (round (/ n m))))
(define (round-remainder n m)
  (- n (* m (round-quotient n m))))
(define (round/ n m)
  (values (round-quotient n m) (round-remainder n m)))

(define (ceiling-quotient n m)
  (inexact->exact (ceiling (/ n m))))
(define (ceiling-remainder n m)
  (- n (* m (ceiling-quotient n m))))
(define (ceiling/ n m)
  (values (ceiling-quotient n m) (ceiling-remainder n m)))

(define (euclidean/ n m)
  (if (> n 0) (ceiling/ n m) (floor/ n m)))
(define (euclidean-quotient n m)
  (if (> n 0) (ceiling-quotient n m) (floor-quotient n m)))
(define (euclidean-remainder n m)
  (if (> n 0) (ceiling-remainder n m) (floor-remainder n m)))

(define (centered-remainder n m)
  (let ((r (euclidean-remainder n m))
        (m/2 (abs (/ m 2))))
    (cond ((< r (- m/2)) (+ r (abs m)))
          ((>= r m/2) (- r (abs m)))
          (else r))))
(define (centered-quotient n m)
  (quotient (- n (centered-remainder n m)) m))
(define (centered/ n m)
  (values (centered-quotient n m) (centered-remainder n m)))