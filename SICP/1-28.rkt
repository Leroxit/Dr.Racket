#lang planet neil/sicp
(define (square x) (* x x))

(define (square-check x m)
  (if (and (not (or (= x 1) (= x (- m 1))))
           (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (square-check (expmod base (/ exp 2) m) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (mil-rab x)
  (define (try a)
    (= (expmod a (- x 1) x) 1))
(try (random x)))
