#lang sicp
(define (double x)
  (* x 2))
(define (halve x)
  (/ x 2))
 
;a * b = 2 * (a * b/2) if b is even
(define (mult x y)
  (cond ((= y 0) 0)
        ((= y 1) x)
        ((= (remainder y 2) 0) (double (mult x (halve y))))
        (else (+ x (mult x (- y 1))))))
