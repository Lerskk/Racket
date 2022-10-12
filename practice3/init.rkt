#lang racket/base
(require 2htdp/image)
(require 2htdp/universe)

(define DEFAULT-COLOR "blue")

;; display function
(define (draw-circle color)
	(circle 6 "solid" color))


;; state string -> state
(define (change-color color new-color)
	(cond
		[(key=? new-color "n") "black"]
		[(key=? new-color " ") DEFAULT-COLOR]
		[(key=? new-color "q") "quit"]
		[else color]))

(define (end? state)
	(string=? state "quit"))

;;; (big-bang DEFAULT-COLOR
;;; 	[to-draw draw-circle]
;;; 	[on-key change-color]
;;; 	[stop-when end?])


(define INITIAL-SIZE 50)
(define CANVAS-SIZE 300)
(define (center size)
	(/ CANVAS-SIZE 2))

(define (stop? state)
	(or (<= state 10) (>= state 110)))

;; state -> image
(define (circle-color color size)
	(place-image (circle size "solid" color) (center CANVAS-SIZE) (center CANVAS-SIZE) (empty-scene CANVAS-SIZE CANVAS-SIZE)))

(define (make-circle size)
	(cond	
		[(<= size 50) (circle-color "yellow" size)]
		[(<= size 100) (circle-color "red" size)]
		[(> size 100) (circle-color "green" size)]))

;; state -> state
(define (re-size size)
	(if (< (+ size 1) (/ CANVAS-SIZE 2)) 
		(+ size 1)
		0))

(define (change-size key-state new-size)
	(cond
		[(number? (string->number new-size)) (* (string->number new-size) 10)]
		[else key-state]))

(big-bang INITIAL-SIZE
	[to-draw make-circle]
	[on-tick re-size 0.05]
	[on-key change-size]
	[stop-when stop?])
