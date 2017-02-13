#lang racket
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (element-of-set? x set) 
  (cond ((null? set) false) 
        ((equal? x (car set)) true) 
        (else (element-of-set? x (cdr set)))))

 (define (encode message tree) 
   (if (null? message) 
       '() 
       (append (encode-symbol (car message) tree) 
               (encode (cdr message) tree))))

(define (encode-symbol smb tree)
  (cond ((element-of-set? smb (symbols (left-branch tree)))
         (if (leaf? (left-branch tree))
             '(0)
             (cons 0 (encode-symbol smb (left-branch tree)))))
        ((element-of-set? smb (symbols (right-branch tree)))
         (if (leaf? (right-branch tree))
             '(1)
             (cons 1 (encode-symbol smb (right-branch tree)))))
        (else (error "symbol missing"))))
        
(define sample-tree 
  (make-code-tree (make-leaf 'A 4) 
                  (make-code-tree 
                   (make-leaf 'B 2) 
                   (make-code-tree (make-leaf 'D 1) 
                                    (make-leaf 'C 1))))) 
(encode '(A D A B B C A) sample-tree) 