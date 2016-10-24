#lang sicp
;iterative implementation
(define (last-pair items)
  (if (null? (cdr items))
      (list (car items))
      (last-pair (cdr items))))

;using inbuilt procderue
(define (last-pair1 items)
  (list (list-ref items (- (length items) 1))))