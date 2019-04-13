#lang sicp

;Nested implementation
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
  
;Different approach to testing
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

#lang racket
(define (sqrt x)
  (define (square y)
    (* y y))
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))
  (define (check t) 
    (< (abs (- 1.0 (/ (square t) x))) 0.000001))
    (define (sqrt-iter g)
      (if (check g)
       g
      (sqrt-iter (improve g))))
(sqrt-iter 1.0))

