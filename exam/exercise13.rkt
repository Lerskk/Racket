#lang racket

(require 2htdp/image)
(require 2htdp/universe)

(define state [canvas radius color])

(define WIDTH 300)
(define HEIGHT 300)
(define BACKGROUND "white")
(define CANVAS (place-image (rectangle WIDTH HEIGHT "solid" BACKGROUND) (/ WIDTH 2) (/ HEIGHT 2) (empty-scene WIDTH HEIGHT)))

(define RADIUS 20)

(define COLOR "red")

(define INIT (make-state CANVAS RADIUS COLOR))

(define (draw state) (state-canvas state))

(define (mouse-handler state x y button)
  (cond
    [(string=? button "button-down") (make-state (place-image (circle (state-radius state) "solid" (state-color state)) x y (state-canvas state)) (state-radius state) (state-color state))]
    [else state]))

(define (change-color state color)
  (make-state (state-canvas state) (state-radius state) color))

(define (change-radius state radius)
  (make-state (state-canvas state) radius (state-color state)))

(define (key-handler state key)
  (cond
    [(key=? key "b") (change-color state "blue")]
    [(key=? key "m") (change-color state "magenta")]
    [(key=? key "g") (change-color state "green")]
    [(key=? key "up") (change-radius state (* (state-radius state) 2))]
    [(key=? key "down") (change-radius state (/ (state-radius state) 2))]
    [(key=? key "r") INIT]
    [else state]))

(big-bang INIT
          [to-draw draw]
          [on-key key-handler]
          [on-mouse mouse-handler])
