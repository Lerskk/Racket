#lang racket/base
(require 2htdp/image)
(require 2htdp/universe)

(define-struct Coord [x y])

(define CANVAS-WIDTH 300)
(define CANVAS-HEIGHT 200)
(define START (make-Coord (/ CANVAS-WIDTH 2) (/ CANVAS-HEIGHT 2)))
(define BODY (ellipse 60 30 "solid" "black"))
(define EYE (overlay (circle 2 "solid" "black") (circle 10 "outline" "black") (circle 9 "solid" "white")))
(define FLY (place-image EYE 50 25(place-image EYE 50 5 BODY)))
(define DELTA 10)
(define GAMMA 50)

(define (move-on-tick position)
	(cond
		[(and (= (random 4) 1) (< (Coord-x position) (- CANVAS-WIDTH (image-width FLY)))) (make-Coord (+ (Coord-x position) DELTA) (Coord-y position))]
		[(and (= (random 4) 2) (> (Coord-x position) (image-width FLY))) (make-Coord (- (Coord-x position) DELTA) (Coord-y position))]
		[(and (= (random 4) 3) (< (Coord-y position) (- CANVAS-HEIGHT (image-height FLY)))) (make-Coord (Coord-x position) (+ (Coord-y position) DELTA))]
		[(and (= (random 4) 3) (> (Coord-y position) (image-height FLY))) (make-Coord (Coord-x position) (- (Coord-y position) DELTA))]
		[else position]))

(define (distance-between-points first-coord second-coord)
	(cond
		[(or (not (Coord? first-coord)) (not (Coord? second-coord))) "Invalid coordinates"]
		[else (sqrt (+ (expt (- (Coord-x first-coord) (Coord-x second-coord)) 2) (expt (- (Coord-y first-coord) (Coord-y second-coord)) 2)))]))
	
(define (mouse-handler position x y button-state)
	(cond 
		[(and (string=? button-state "button-down")  (< (distance-between-points position (make-Coord x y)) GAMMA)) (make-Coord -1 -1)]
		[else position]))

(define (draw-fly position)
	(place-image FLY (Coord-x position) (Coord-y position) (empty-scene CANVAS-WIDTH CANVAS-HEIGHT)))
	
(define (stop position )
	(and (= (Coord-x position) -1) (= (Coord-y position) -1)))

(define (last-scene position)
	(place-image (text "Fly catched" 20 "indigo") (/ CANVAS-WIDTH 2) (/ CANVAS-HEIGHT 2) (empty-scene CANVAS-WIDTH CANVAS-HEIGHT)))

(big-bang START
	[to-draw draw-fly]
	[on-tick move-on-tick]
	[on-mouse mouse-handler]
	[stop-when stop last-scene])