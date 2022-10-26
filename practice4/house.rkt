#lang racket/base
(require 2htdp/image)

(define-struct House [propetary direction surface zone])

(define (zone-cost zone)
	(cond
		[(string=? zone "A") 20000]
		[(string=? zone "B") 15000]
		[(string=? zone "C") 10000]
		[(string=? zone "D") 5000]))

(define (surface-cost surface zone)
	(* surface (zone-cost zone)))


(define (total-cost house)
	(if (>= (surface-cost (House-surface house) (House-zone house)) 1000000) (* (surface-cost (House-surface house) (House-zone house)) 0.95) (* (surface-cost (House-surface house) (House-zone house)) 1.03)))

(define (display-total-cost house)
	(string-append (House-propetary house) " will obtain " (number->string (total-cost house)) " as the result of selling the property located on " (House-direction house)))

(display-total-cost (make-House "Fausto" "some place" 300 "A"))