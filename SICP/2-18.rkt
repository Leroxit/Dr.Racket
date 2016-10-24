#lang sicp
(define (reverse items)
  (define (iter n res)
    (if (= n (length items))
        res
        (iter (+ n 1) (cons (list-ref items n) res))))
  (iter 0 (list)))
    