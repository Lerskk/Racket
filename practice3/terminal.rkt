#lang racket/base
(require 2htdp/image)
(require 2htdp/universe)

(define (draw state)
	(place-image/align (text state 20 "indigo") 0 0 "left" "top" (empty-scene 800 60))
)

(define (keys-manager state key)
	(cond
		[(and (not (string=? state "")) (key=? key "\b")) (substring state 0 (- (string-length state) 1))]
		[else (string-append state key)]))

(big-bang ""
	[to-draw draw]
	[on-key keys-manager])