#lang sicp

(define (pair-p a b)
  (* (expt 2 a) (expt 3 b)))

(define (car-p n)
  (define (iter x result)
  (if (= 0 (remainder x 2))           
      (iter (/ x 2) (+ 1 result))
      result))
  (iter n 0))

(define (cdr-p n)
  (define (iter x result)
  (if (= 0 (remainder x 3))
      (iter (/ x 3) (+ 1 result))
      result))
  (iter n 0))