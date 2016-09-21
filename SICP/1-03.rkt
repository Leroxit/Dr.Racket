#lang sicp

(define (square x) (* x x))
(define (largest x y z)
(cond ((>= x y z) (+ (square x) (square y)))
((> z y) (largest x z y))
((> y x) (largest y x z))))

(define (test x y z) 
   (if (>= x y) 
       (if (>= y z) 
           (+ (* x x) (* y y)) 
           (+ (* x x) (* z z))) 
       (if (>= x z) 
           (+ (* y y) (* x x)) 
           (+ (* y y) (* z z))))) 
