#lang racket/base
(require 2htdp/image)
(require 2htdp/universe)

(define CANVAS-HIGHT 500)
(define CANVAS-WIDTH 500)
(define CANVAS-COLOR "black")
(define STAR-SIZE 5)
(define (star-scale x) (+ STAR-SIZE (* x 0.1)))
(define STAR-COLOR "white")
(define EMPTY-SKY (rectangle CANVAS-HIGHT CANVAS-WIDTH "solid" CANVAS-COLOR))


(define (draw-sky state)
	state)

(define (mouse-manager state x y mouse-state)
	(cond
		[(and (>= x (star-scale x)) (>= y (star-scale x)) (<= x (- CANVAS-WIDTH (star-scale x))) (<= y (- CANVAS-HIGHT (star-scale x))) (string=? mouse-state "button-down")) 
			(place-image (star (star-scale x) "solid" STAR-COLOR) x y state)]
		[else state]))

(define (keys-manager state key)
	(cond
		[(key=? key "\b") EMPTY-SKY]
		[else state]))

(big-bang EMPTY-SKY
	[to-draw draw-sky]
	[on-mouse mouse-manager]
	[on-key keys-manager])