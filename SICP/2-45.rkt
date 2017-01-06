#lang racket
(require sicp-pict)

(define (split direction method)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split direction method) painter (- n 1))))
          (direction painter (method smaller smaller))))))

(define right-split (split beside below))

(define up-split (split below beside))
