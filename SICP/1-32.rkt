#lang sicp
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-it term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (inc x) (+ x 1))
(define (identity x) x)

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) inc b))))

(define (accumulate-it combiner null-value term a next b)
  (define (iter a result)
  (if (> a b)
      result
      (iter (next a) (combiner result (term a)))))
  (iter a null-value))
;Try (accumulate * 1 identity 1 inc 4) or (accumulate + 0 identity 1 inc 4) to test