#lang racket/base
(require 2htdp/image)
(require 2htdp/universe)

(define-struct Terminal [txt font-size font-color])
(define START (make-Terminal "" 12 "black"))

(define (draw terminal-state)
	(place-image/align (text (Terminal-txt terminal-state) (Terminal-font-size terminal-state) (Terminal-font-color terminal-state)) 0 0 "left" "top" (empty-scene 800 60))
)

(define (select-color key)
	(cond 	
		[(key=? key "f1") "red"]
		[(key=? key "f2") "turquoise"]
		[(key=? key "f3") "yellow"]
		[(key=? key "f4") "green"]
		[(key=? key "f5") "white"]
		[(key=? key "f6") "black"]
		[else #f]))

(define (keys-manager terminal-state key)
	(cond
		[(select-color key) (make-Terminal (Terminal-txt terminal-state) (Terminal-font-size terminal-state) (select-color key))]
		[(key=? key "up") (make-Terminal (Terminal-txt terminal-state) (+ (Terminal-font-size terminal-state) 2) (Terminal-font-color terminal-state))]
		[(and (key=? key "down") (<= (Terminal-font-size terminal-state) 2)) (make-Terminal (Terminal-txt terminal-state) (Terminal-font-size terminal-state) (Terminal-font-color terminal-state))]
		[(and (key=? key "down") (> (Terminal-font-size terminal-state) 2)) (make-Terminal (Terminal-txt terminal-state) (- (Terminal-font-size terminal-state) 2) (Terminal-font-color terminal-state))]
		[(key=? key "\b") 
			(make-Terminal (substring (Terminal-txt terminal-state) 0 (- (string-length (Terminal-txt terminal-state)) 1)) (Terminal-font-size terminal-state) (Terminal-font-color terminal-state))]
		[else (make-Terminal (string-append (Terminal-txt terminal-state) key) (Terminal-font-size terminal-state) (Terminal-font-color terminal-state))]))
;;; 
(big-bang START
	[to-draw draw]
	[on-key keys-manager])