#lang sicp
(define (f-rec n)
  (if (< n 3)
        n
        (+ (f-rec (- n 1))
           (* 2 (f-rec (- n 2)))
           (* 3 (f-rec (- n 3))))))

(define (f-it n)
  (define (f-count a b c i)
    (if (= i n)
        a
        (f-count (+ a (* 2 b) (* 3 c)) a b (+ i 1))))
  (if (< n 3)
      n
      (f-count 2 1 0 2)))
