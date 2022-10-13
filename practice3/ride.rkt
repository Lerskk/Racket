#lang racket/base
(require 2htdp/image)
(require 2htdp/universe)

(define CANVAS-WIDTH 500)
(define CANVAS-HIGHT 200)

(define CAR (rectangle 50 30 "solid" "green"))
(define MIDDLE (/ (image-width CAR) 2))

(define (draw-car x-coord)
	(place-image CAR x-coord (/ CANVAS-HIGHT 2) (empty-scene CANVAS-WIDTH CANVAS-HIGHT)))

(define (clock x-coord)
	(cond
		[(<= (+ x-coord 3) (- CANVAS-WIDTH MIDDLE)) (+ x-coord 3)]
		[else (- CANVAS-WIDTH MIDDLE)]))

(define (keys-manager x-coord key)
	(cond
		[(key=? key " ") MIDDLE]
		[(and (<= (+ x-coord 3) (- CANVAS-WIDTH MIDDLE)) (key=? key "right")) (+ x-coord 20)]
		[(and (>= (- x-coord 3) MIDDLE) (key=? key "left")) (- x-coord 20)]
		[else x-coord]))

(define (mouse-manager x-coord x y click-state)
	(cond
		[(string=? click-state "button-down") x]
		[else x-coord]))

(big-bang MIDDLE
	[to-draw draw-car]
	[on-tick clock]
	[on-key keys-manager]
	[on-mouse mouse-manager])