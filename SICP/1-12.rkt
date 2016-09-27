#lang sicp
 (define (pas x y) 
   (cond ((or (< x 1) (< y 1)) 0)
         ((or (= x 1) (= x y)) 1)    ;First number in a row and the last = 1 (By defenition: numbers of collumns = number of rows, so x=y)
         (else (+ (pas x (- y 1))    ;Add two numbers, which are higher (y-1), one is same x-coordinate, and the other is previous (x-1
                  (pas (- x 1) (- y 1))))))
