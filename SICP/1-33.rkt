#lang sicp
(define (filtered-accumulate filter combiner null-value term a next b) ;recursive process
  (if (> a b)
      null-value
  (if (filter a)
      (combiner (term a)
                (filtered-accumulate filter combiner null-value term (next a) inc b))
      (filtered-accumulate filter combiner null-value term (next a) inc b))))

(define (filtered-accumulate-it filter combiner null-value term a next b) ;iterative process
  (define (iter a result)
  (if (> a b)
      result
  (if (filter a)
      (iter (next a) (combiner result (term a)))
      (iter (next a) result))))
  (iter a null-value))

(define (square x) (* x x))
(define (inc x) (+ x 1))
(define (identity x) x)

(define (prime? n)
   (define (smallest-divisor n)
      (define (find-divisor n test-divisor)
         (define (next x)
            (if (= x 2) 3 (+ x 2)))
         (define (divides? a b)
            (= (remainder b a) 0))
         (cond ((> (square test-divisor) n) n)
               ((divides? test-divisor n) test-divisor)
               (else (find-divisor n (next test-divisor)))))
      (find-divisor n 2))
   (= n (smallest-divisor n)))

(define (sumopq a b)  ;sum of prime squares
  (filtered-accumulate-it prime? + 0 identity 1 inc b))

(define (porp n)      ;product of related primes
  (define (cprime x) (= 1 (gcd x n)))
  (filtered-accumulate-it cprime * 1 identity 1 inc n))