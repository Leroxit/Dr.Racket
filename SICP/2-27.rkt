#lang sicp
(define (deep-reverse items)
  (define (iter n res)
    (if (= n (length items))
        res
        (if (pair? (list-ref items n))
            (iter (+ n 1) (cons (deep-reverse (list-ref items n)) res))
            (iter (+ n 1) (cons (list-ref items n) res)))))
  (iter 0 (list)))