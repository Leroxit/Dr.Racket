#lang sicp
(define (compose a b)
  (lambda (x) (a (b x))))

(define (repeated f n)
    (if (< n 1)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))

(define (n-fold-smooth f n dx)
  (define (smooth f)
    (lambda (x) (/ (+ (f x)
                    (f (+ x dx))
                    (f (- x dx)))
                 3)))
   ((repeated smooth n) f))  
