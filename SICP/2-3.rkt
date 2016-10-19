#lang sicp
(define point cons)
(define x car)
(define y cdr)
(define (rectangle a b)        ;Rectangle "a" - contains cpordinates, "b" - contains Width and Height 
  (cons (cons a b)
        (cons (abs (- (x a) (x b)))
              (abs (- (y a) (y b)))))) 


(define (perimeter r)
  (* 2 (+ (car (cdr r)) (cdr (cdr r)))))

(define (area r)
  (* (car (cdr r)) (cdr (cdr r))))