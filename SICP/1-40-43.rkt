#lang sicp
(define (square x) (* x x))

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x)
       (* a (* x x))
       (* b x)
       c)))

(define (double f)
  (lambda (x) (f (f x))))

(define (compose a b)
  (lambda (x) (a (b x))))

(define (repeated f n)
  (if (< n 1)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))
