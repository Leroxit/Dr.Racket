#lang sicp
(define (check g ig) 
   (define tolerance 0.000001) 
   (< (/ (abs (- g ig)) ig)  tolerance))

(define (iterative-improve good? improve)
  (define (iter guess)
    (if (good? guess (improve guess))
        guess
        (iter (improve guess))))
  iter)

(define (sqrt x)
  (define (square x) (* x x))
  (define (average x y) (/ (+ x y) 2))
  ((iterative-improve check
                     (lambda (guess) (average guess (/ x guess))))
   1.0))

(define (fixed-point f first)
  ((iterative-improve check
                      f)
   first))