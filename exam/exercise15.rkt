#lang racket

(require 2htdp/image)
(require 2htdp/universe)

(define-struct coord [x y])

(define WIDTH 500)
(define HEIGHT 300)
(define BACKGROUND "yellow")
(define CANVAS (place-image (rectangle WIDTH HEIGHT "solid" BACKGROUND) (/ WIDTH 2) (/ HEIGHT 2) (empty-scene WIDTH HEIGHT)))
(define SIZE 15)

(define (get-x list) (coord-x (first list)))

(define (get-y list) (coord-y (first list)))

(define (draw status)
  (cond
    [(empty? status) CANVAS]
    [(empty? (rest status)) (place-image (circle SIZE "solid" "black") (get-x status) (get-y status) CANVAS)]
    [else (place-image (circle SIZE "solid" "black") (get-x status) (get-y status) (draw (rest status)))]))

(define (key-handler status key)
  (cond
    [(key=? key " ") (cons (make-coord (random (- WIDTH SIZE)) (random (- HEIGHT SIZE))) status)]
    [(key=? key "b") empty]
    [(key=? key "u") (rest status)]
    [else status]))

(big-bang empty
          [to-draw draw]
          [on-key key-handler])
