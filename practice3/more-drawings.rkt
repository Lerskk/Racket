#lang racket/base
(require 2htdp/image)
(require 2htdp/universe)

(define CANVAS-WIDTH 75)
(define CANVAS-HIGHT 50)
(define DEFAULT (empty-scene CANVAS-WIDTH CANVAS-HIGHT))
(define SHAPE-SIZE 10)

(define (color state)
	(cond
		[(string=? state "") state]
		[(string=? (substring state 1 2) "b") "blue"]
		[(string=? (substring state 1 2) "g") "green"]))

(define (shape state)
	(cond
		[(string=? state "") state]
		[(string=? (substring state 0 1) "t") (triangle SHAPE-SIZE "solid" (color state))]
		[(string=? (substring state 0 1) "c") (circle SHAPE-SIZE "solid" (color state))]))

(define (draw-shape state)
	(cond
		[(not (string=? state "")) (place-image (shape state) (random CANVAS-WIDTH) (random CANVAS-HIGHT) DEFAULT)]
		[else DEFAULT]))

(define (keys-manager state key)
	(cond
		[(key=? key "t") (string-append "t" (substring state 1 2))]
		[(key=? key "c") (string-append "c" (substring state 1 2))]
		[else state]))

(define (clock state)
	(cond
		[(string=? (substring state 1 2) "b") (string-append (substring state 0 1) "g")]
		[(string=? (substring state 1 2) "g") (string-append (substring state 0 1) "b")]
		[else state]))

(big-bang "tg"
	[to-draw draw-shape]
	[on-key keys-manager]
	[on-tick clock 1])