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


(define INITIAL-SIZE 100)
(define CANVAS-SIZE 200)

(define (stop? state)
	(= state 0))

;; state -> image
(define (make-circle size)
	(place-image (circle size "solid" "red") 100 100 (empty-scene CANVAS-SIZE CANVAS-SIZE)))

;; state -> state
(define (re-size size)
	(- size 0.1))

(big-bang INITIAL-SIZE
	[to-draw make-circle]
	[on-tick re-size 0.005]
	[stop-when stop?])
