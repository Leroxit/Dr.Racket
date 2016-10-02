#lang sicp
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-it term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (inc n) (+ n 1))

(define (factorial x)
  (define (identity x) x)
  (product-it identity 1 inc x))

(define (pi a)
  (define (top x)               ;Using this procedures for these formula's sequences. For numerators (2,4,4,6,6..) if counter is not even -> (-1)
    (if (even? x) x (- x 1)))   ;For denominator: If counter is even -> (-1).  (Example for numerator: 3->2, 4->4, 5->4, 6->6, 7->6...)
  (define (bot  x)           
    (if (even? x) (- x 1) x))
  (* 4 (/ (product-it top 3 inc a)
          (product-it bot 3 inc a))))
;If Racket shows rational number to you, use this command: (exact->inexact <procedure>)
