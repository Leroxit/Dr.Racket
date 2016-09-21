#lang sicp
 (define (pascal row col) 
   (cond ((or (< row col) (< col 0)) 0) 
         ((or (= row col) (= col 1)) 1) 
         (+ (pascal (- row 1) col)
            (pascal (- row 1) (- col -1)))))