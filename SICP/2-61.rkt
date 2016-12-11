#lang racket
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set-dupl x set)
  (if (or (< x (car set)) (= x (car set)))
      (cons x set)
      (cons (car set) (adjoin-set-dupl x (cdr set)))))

(define (adjoin-set x set)
  (cond ((null? set) (cons x set))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        ((> x (car set)) (cons (car set)
                               (adjoin-set x (cdr set))))))