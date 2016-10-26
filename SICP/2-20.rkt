#lang sicp
(define (same-parity first . rest)
  
  (define (construct check items result)
    (if (null? items)
      result
      (construct check (cdr items) (if (check (list-ref items 0))
                                           (append result (list (list-ref items 0)))
                                           result))))
  
  (construct (if (even? first) even? odd?) rest (list first)))
