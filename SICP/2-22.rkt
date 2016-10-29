#lang sicp
(define (square-list-it items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                    (list (* (car things) (car things)))))))
  (iter items nil))