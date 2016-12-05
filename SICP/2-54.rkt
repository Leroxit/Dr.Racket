#lang racket
(define (equal?1 list1 list2)
  (if (and (pair? list1) (pair? list2))
      (and (equal?1 (car list1) (car list2))
           (equal?1 (cdr list1) (cdr list2)))
      (eq? list1 list2)))