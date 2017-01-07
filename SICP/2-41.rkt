#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
          
(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))
(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (triplets n)
   (flatmap (lambda (i)
              (flatmap (lambda (j)
                         (map (lambda (k) (list i j k)) (enumerate-interval 1 (- j 1))))
                       (enumerate-interval 1 (- i 1))))
            (enumerate-interval 1 n)))

(define (triplets-sum n s)
  (define (3-sum sequence)
    (= s (accumulate + 0 sequence)))
  (filter 3-sum (triplets n)))
