#lang sicp
;S = 1 + 1/2! + 1/3! + ... + 1/n!

(define (sum n)
  (define (fac x)
  (if (= x 1) 1
      (* x (fac (- x 1)))))
  (define (sump n r i)
  (if (= i n) r
      (sump n (+ r (/ 1 (fac (+ i 1)))) (+ i 1))))
  (if (< n 1) 0  
  (sump n 1 1)))
