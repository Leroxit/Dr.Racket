#lang sicp
(define (cube x) (* x x x))

(define (inc x) (+ x 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))              ;defining some values separetly, to decompose problem in smaller parts
  (define (y k) (f (+ a (* k h))))          
  (define (term k)                      ;"term" gets "k" from "sum" procedure, where a i changing by +1 with each step until a=n
    (* (y k) (cond ((or (= k 0) (= k n)) 1)
         ((even? k) 2)
         (else 4))))
  (/ (* h (sum term 0 inc n)) 3))