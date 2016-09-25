#lang sicp
 (define (pas x y)
   (cond ((or (< x 1) (< y 1)) 0)
         ((or (= x 1) (= x y)) 1)
         (else (+ (pas x (- y 1))
                  (pas (- x 1) (- y 1))))))
