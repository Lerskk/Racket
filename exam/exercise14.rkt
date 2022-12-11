#lang racket

(require 2htdp/image)
(require 2htdp/universe)

(define-struct state [canvas color shape])

(define WIDTH 300)
(define HEIGHT 300)
(define CANVAS (empty-scene WIDTH HEIGHT))

(define SIZE 10)

(define INIT (make-state CANVAS "red" "square"))

(define (draw state) (state-canvas state))

(define (change-canvas state canvas)
  (make-state canvas (state-color state) (state-shape state)))

(define (change-color state color)
  (make-state (state-canvas state) color (state-shape state)))

(define (change-shape state shape)
  (make-state (state-canvas state) (state-color state) shape))

(define (new-shape state)
  (if (string=? (state-shape state) "square")
    (square SIZE "solid" (state-color state))
    (circle SIZE "solid" (state-color state))))

(define (mouse-handler state x y button)
  (cond
    [(string=? button "button-down") (change-canvas state (place-image (new-shape state) x y (state-canvas state)))]
    [else state]))


(define (key-handler state key)
  (cond
    [(key=? key "r") (change-color state "red")]
    [(key=? key "g") (change-color state "green")]
    [(key=? key "b") (change-color state "blue")]
    [(key=? key "s") (change-shape state "square")]
    [(key=? key "c") (change-shape state "circle")]
    [else state]))

(big-bang INIT
          [to-draw draw]
          [on-mouse mouse-handler]
          [on-key key-handler])

