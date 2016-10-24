#lang sicp
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define x-point car)
(define y-point cdr)

(define make-point cons)
(define make-segment cons)

(define (mid-point segment)
  (cons (/ (+ (x-point (car segment)) (x-point (cdr segment))) 2)
        (/ (+ (y-point (car segment)) (y-point (cdr segment))) 2)))
  
