#lang racket
(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))
        
;Description of this algorithm is here:        
;https://en.wikipedia.org/wiki/Power_set#Algorithms
