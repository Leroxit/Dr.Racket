#lang sicp
(define (cont-frac n d k)
  (define (frac i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (n i) (frac (+ i 1))))))
  (frac 1))

(define (cont-frac-it n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter (- k 1) (/ (n k) (d k))))

(define e
  (+ 2 (cont-frac-it (lambda (i) 1.0)
                     (lambda (i) (if (= 0 (remainder (+ i 1) 3))
                                     (* 2 (/ (+ i 1) 3))
                                     1))
                     20.0)))

(define (tan-cf x)
  (cont-frac-it (lambda (i)
                  (if (= i 1) x (- (* x x))))
                (lambda (i)
                  (- (* i 2) 1))
                10.0))