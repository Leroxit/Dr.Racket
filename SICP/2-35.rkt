#lang racket
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (count-leaves1 t)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))

(define (count-leaves2 t)
  (accumulate (lambda (x y) (+ 1 y)) 0 (enumerate-tree t)))

(define (count-leaves3 t)
  (accumulate + 0 (map (lambda (x) (if (pair? x) (count-leaves3 x) 1)) t)))
