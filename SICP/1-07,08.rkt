#lang sicp

(define (sqrtt x)
  (define (improve guess)
     (/ (+ guess (/ x guess)) 2))
  (define (good? guess)
    (< (abs (- (* guess guess) x)) 0.001))
  (define (try guess)
    (if (good? guess)
        guess
        (try (improve guess))))
  (try 1.0))
  
;Nested implementation
(define (sqrt2 x)
  (define (try guess oldguess)
    (if (good? guess oldguess)
       guess
       (try (improve guess) guess)))
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))
  (define (good? a b)
    ;(<= (abs (/ (- a b) b)) 0.001))
    (<= (abs (- a b)) (* a 0.001)))
(try 1.0 x))

;Cube root
(define (sqrt3 x)
  (define (try g og)
    (if (good? g og)
       g
       (try (improve g) g)))
  (define (improve g)
    (/ (+ (* 2 g) (/ x (* g g))) 3))
  (define (good? a b)
    ;(<= (abs (/ (- a b) b)) 0.001))
    (<= (abs (- a b)) (* a 0.001)))
(try 1.0 x))
