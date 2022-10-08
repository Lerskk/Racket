#lang racket/base
(require 2htdp/image)

(define (classify-image img) 
	(cond
		[(= (image-width img) (image-height img)) "Square"]
		[(>= (image-width img) (* (image-height img) 2)) "Very width"]
		[(>= (image-width img) (image-height img)) "Width"]
		[(<= (* (image-width img) 2) (image-height img)) "Very narrow"]
		[else "Narrow"]
		))

(classify-image (rectangle 3 3 "solid" "red"))
(classify-image (rectangle 1 3 "solid" "red"))
(classify-image (rectangle 2 3 "solid" "red"))
(classify-image (rectangle 3 1 "solid" "red"))
(classify-image (rectangle 3 2 "solid" "red"))

(define (clasificar t) (cond [(< t 0) "Muy frío (MF)"]
                             [(and (> t 0) (< t 15)) "Frío (F)"]
                             [(and (>= t 15) (< t 25)) "Agradable (A)"]
                             [(> t 25) "Caluroso (C)"]))

(clasificar -3)
(clasificar 28)
(clasificar 15)