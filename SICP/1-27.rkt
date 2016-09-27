#lang planet neil/sicp
(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test a n)
  (= (expmod a n n) a))

(define (full-fermat n)
  (define (fer-iter a)
    (if (< a n) ;Terminating condition
    (if (fermat-test a n) ;If passes ferma test, use next number
         (fer-iter (+ a 1))
         #false)
    #true))
(fer-iter 1))