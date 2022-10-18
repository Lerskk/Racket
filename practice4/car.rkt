#lang racket/base
(require 2htdp/image)
(require 2htdp/universe)

(define-struct Car [position velocity])

(define CAR (rectangle 50 30 "solid" "green"))
(define CANVAS-WIDTH 500)
(define CANVAS-HEIGHT 200)
(define START (make-Car (+ (/ (image-width CAR) 2) 1) 1))
(define DELTA-VELOCITY 1)

(define (draw-car car-status)
	(place-image CAR (Car-position car-status) (/ CANVAS-HEIGHT 2) (empty-scene CANVAS-WIDTH CANVAS-HEIGHT)))

(define (move-per-tick car-status)
	(cond
		[(or (< (- (Car-position car-status) (Car-velocity car-status)) (/ (image-width CAR) 2)) (>= (+ (Car-position car-status) (Car-velocity car-status)) (- CANVAS-WIDTH (/ (image-width CAR) 2)))) car-status]
		[else (make-Car (+ (Car-position car-status) (Car-velocity car-status)) (Car-velocity car-status))]))

(define (keys-handler car-status key)
	(cond
		[(key=? key "up") (make-Car (Car-position car-status) (+ (Car-velocity car-status) DELTA-VELOCITY))]
		[(key=? key "down") (make-Car (Car-position car-status) (- (Car-velocity car-status) DELTA-VELOCITY))]
		[(key=? key " ") (make-Car (+ (/ (image-width CAR) 2) 1) (Car-velocity car-status))]
		[else car-status]))

(big-bang START
	[to-draw draw-car]
	[on-tick move-per-tick]
	[on-key keys-handler])