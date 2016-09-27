#lang sicp
(define (double x)
  (* x 2))
(define (halve x)
  (/ x 2))
(define (mult x y)
  (define (iter x y a)                      ; a - accumulator
  (cond ((= y 0) a)                         ; termination
        ((= (remainder y 2) 0) (iter (double x) (halve y) a))  ; if "y" is "even", then x*y= (2\2)*(x*y) = 2*x*(y\2)
        (else (iter x (- y 1) (+ a x)))))                      ; x*y=x*(y-1)+x
  (iter x y 0))
