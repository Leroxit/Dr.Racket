#lang racket
(require sicp-pict)

(define (make-vect x y)
   (cons x y))
(define (xcor-vect v)
   (car v))
(define (ycor-vect v)
   (cdr v))

(define (add-vect u v)
   (make-vect
     (+ (xcor-vect u) (xcor-vect v))
     (+ (ycor-vect u) (ycor-vect v))))
(define (sub-vect u v)
   (make-vect
     (- (xcor-vect u) (xcor-vect v))
     (- (ycor-vect u) (ycor-vect v))))
(define (scale-vect s v)
   (make-vect
     (* s (xcor-vect v))
     (* s (ycor-vect v))))

(define (make-segment vector1 vector2)
  (cons vector1 vector2))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter
         (make-frame new-origin
                     (sub-vect (m corner1) new-origin)
                     (sub-vect (m corner2) new-origin)))))))

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))
(define (rotate90 painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))
(define (rotate180 painter)
  (transform-painter painter
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 0.0)))
(define (rotate270 painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

(define (below1 painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-top
           (transform-painter painter2
                              split-point
                              (make-vect 1.0 0.5)
                              (make-vect 0.0 1.0)))
          (paint-bottom
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              (make-vect 1.0 0.0)
                              split-point)))
      (lambda (frame)
        (paint-top frame)
        (paint-bottom frame)))))

(define (below2 painter1 painter2)
  (rotate270 (beside (rotate90 painter1) (rotate90 painter2))))
