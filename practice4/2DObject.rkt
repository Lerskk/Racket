#lang racket/base
(require 2htdp/image)
(require 2htdp/universe)

(define-struct Coords [x y])

(define CANVAS-WIDTH 300)
(define CANVAS-HEIGHT 300)
(define START (make-Coords (/ CANVAS-WIDTH 2) (/ CANVAS-HEIGHT 2)))
(define OBJECT-SIZE 20)
(define DELTA 5)
(define OBJECT (circle OBJECT-SIZE "solid" "black"))

(define (draw-object position)
	(place-image OBJECT (Coords-x position) (Coords-y position) (empty-scene CANVAS-WIDTH CANVAS-HEIGHT))) 

(define (x-boundaries x) 
	(and (> x OBJECT-SIZE) (< x (- CANVAS-WIDTH OBJECT-SIZE))))
(define (y-boundaries y)  
	(and (> y OBJECT-SIZE) (< y (- CANVAS-HEIGHT OBJECT-SIZE))))
(define (boundaries x y) 
		(and (x-boundaries x) (y-boundaries y)))

(define (mouse-handler position x y button-state)
	(cond
		[(and (boundaries x y) (string=? button-state "button-down")) (make-Coords x y)]
		[else position]))

(define (keys-handler position direction)
	(cond
		[(and (key=? direction "down") (< (Coords-y position) (- CANVAS-HEIGHT OBJECT-SIZE))) (make-Coords (Coords-x position) (+ (Coords-y position) DELTA))]
		[(and (key=? direction "up") (> (Coords-y position) OBJECT-SIZE)) (make-Coords (Coords-x position) (- (Coords-y position) DELTA))]
		[(and (key=? direction "right") (< (Coords-x position) (- CANVAS-WIDTH OBJECT-SIZE))) (make-Coords (+ (Coords-x position) DELTA) (Coords-y position))]
		[(and (key=? direction "left") (> (Coords-x position) OBJECT-SIZE)) (make-Coords (- (Coords-x position) DELTA) (Coords-y position))]
		[(key=? direction " ") START]
		[else position]))

(big-bang START
	[to-draw draw-object]
	[on-mouse mouse-handler]
	[on-key keys-handler])

