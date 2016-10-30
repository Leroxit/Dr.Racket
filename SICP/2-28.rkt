#lang sicp
(define (fringe items)
  (define (iter n res)
    (if (< n 0)
        res
        (if (pair? (list-ref items n))
            (iter (- n 1) (append (fringe (list-ref items n)) res))
            (iter (- n 1) (cons (list-ref items n) res)))))
  (iter (- (length items) 1) (list)))