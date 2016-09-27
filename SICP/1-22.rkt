#lang sicp
;There were implementation of Ferma test previously in 1.2.6, if you cannot understand it - here is quick explanation how it works.
;https://en.wikipedia.org/wiki/Modular_exponentiation
(define (square x) (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

;Straight forward solution wich is doing extra work: (prime?) used twice in each cycle. Here you are selecting "how many prime numbers" you want to find beginning from number
(define (search-for-primes n c)
  (if (> c 0)
      (if (prime? n)
        (begin
          (timed-prime-test n)
          (search-for-primes (+ n 1) (- c 1)))
        (search-for-primes (+ n 1) c))
      (display "Done")))


;Search in specified range, also with new feature:
;Here is implementation of optimisation for cylces. Even number (except 0, 2) cannot be prime, so we can skip then.
;Due to "even number optimisation" - fails when start from 0,1(skips 2),2.
;Moved test for 0,1,2 and even numbers from the main-worker (spfi), and it will test only once.
(define (search-for-primesR start end)
(define (sfpi s)
  (cond ((< s end) (timed-prime-test s) (sfpi (+ s 2)))))
 (if (or (= start 0) (= start 1) (= start 2)) ;0,1,2 tests
    (begin
      (timed-prime-test start)
      (search-for-primesR (+ start 1) end))
    (if (even? start)        ;"even" test
      (search-for-primesR (+ start 1) end)
      (sfpi start))))



;Prime Test Nested implementation. Also can use (even test from above, to optimise)
(define (ptn n c)
(define (nstart-prime-test n start-time)
  (if (prime? n)
      (nreport-prime n (- (runtime) start-time)) ;if prime - display this number and decrease count.
      (ptn (+ n 1) c))) ;if not prime number - add 1 to that number to test it again
(define (nreport-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline)
  (ptn (+ n 1) (- c 1)))
(if (or (< n 1) (< c 1))
  (display "Done") ;terminating case of recursion
  (nstart-prime-test n (runtime))))
