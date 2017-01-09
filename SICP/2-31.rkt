#lang racket
(define (square-tree tree)
  (tree-map square tree))
  
(define (square x) (* x x))

(define (tree-map proc tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map proc (car tree))
                    (tree-map proc (cdr tree))))))
