#lang sicp
(define (square x)
  (* x x))
  
;Using formula, that (b^n/2)^2 = (b^2)^n/2, so when exp is even - square the number, and divide exp. by 2
(define (exp-iter b n)
  (define (iter b n a)
  (cond ((= n 0) a)
        ((= (remainder n 2) 0) (iter (square b) (/ n 2) a))
        (else (iter b (- n 1) (* a b)))))
  (iter b n 1))
