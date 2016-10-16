#lang sicp
(define (log2 x) (/ (log x) (log 2)))
(define (average x y) 
   (/ (+ x y) 2.0))  
(define (average-damp f) 
   (lambda (x) (average x (f x)))) 
  
(define tolerance 0.00001) 
(define (fixed-point f first-guess) 
   (define (close-enough? v1 v2) 
     (< (abs (- v1 v2)) tolerance)) 
   (define (try guess) 
     (let ((next (f guess))) 
       (if (close-enough? guess next) 
           next 
           (try next)))) 
   (try first-guess)) 
  
(define (repeated f n) 
   (if (< n 1) 
       (lambda (x) x)
       (lambda (x) (f ((repeated f (- n 1)) x)))))

(define (nroot n x)
  (fixed-point ((repeated average-damp (floor (log2 x))) (lambda (y) (/ x (expt y (- n 1)))))
               1.0))