#lang racket
(define (make-segment vector1 vector2)
  (cons vector1 vector2))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))