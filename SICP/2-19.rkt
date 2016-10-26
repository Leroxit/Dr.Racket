#lang sicp
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (null? coin-values)) 0)
        (else
         (+ (cc amount
                (cdr coin-values))
            (cc (- amount
                   (car coin-values))
                coin-values)))))
;no-more? = null?
;except-first-denomination = cdr
;first-denomination = car

;Order does not matter, cause procedure evaluates every sub-list - (cc amount (cdr coin-values))