#lang sicp
(define (pascal x y)
  (define (pas x y)
    (if (or (= y 1) (= x y))         ;First number in a row and the last = 1 (By defenition: numbers of collumns = number of rows, so x=y)
        1
        (+ (pas (- x 1) y)           ;Add two numbers, which are higher (x-1), one is same y-coordinate, and the other is previous (y-1)    
           (pas (- x 1) (- y 1)))))
  
  (if (or (< x 1) (< y 1)) 0         ;Check for "less then 1" collumns or rows
      (pas x y)))
