#lang racket
(require sicp-pict)

(define (make-vect x y)
   (cons x y))
(define (xcor-vect v)
   (car v))
(define (ycor-vect v)
   (cdr v))

(define (make-segment vector1 vector2)
  (cons vector1 vector2))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

(define outline-segments
  (list (make-segment
         (make-vect 0.0 0.0)
         (make-vect 0.0 0.99))
        (make-segment
         (make-vect 0.0 0.99)
         (make-vect 0.99 0.99))
        (make-segment
         (make-vect 0.99 0.99)
         (make-vect 0.99 0.0))
        (make-segment
         (make-vect 0.99 0.0)
         (make-vect 0.0 0.0))))

(define Xseg
  (list (make-segment
         (make-vect 0 0)
         (make-vect 1 1))
        (make-segment
         (make-vect 1 0)
         (make-vect 0 1))))

(define diamond-seg
  (list (make-segment
         (make-vect 0.5 0)
         (make-vect 0 0.5))
        (make-segment
         (make-vect 0 0.5)
         (make-vect 0.5 0.99))
        (make-segment
         (make-vect 0.5 0.99)
         (make-vect 0.99 0.5))
        (make-segment
         (make-vect 0.99 0.5)
         (make-vect 0.5 0))))

(define diamond (segments->painter diamond-seg))
(define Xpic (segments->painter Xseg))
(define outline (segments->painter outline-segments))
