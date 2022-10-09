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
                             [(and (> t 15) (< t 25)) "Agradable (A)"]
                             [(> t 25) "Caluroso (C)"]))

(clasificar -3)
(clasificar 28)
(clasificar 15)

(define (sgn2 x) (cond [(< x 0) -1]
                       [(= x 0) 0]
                       [(> x 0) 1]))

(define (sgn3 x) 
	(cond 
		[(and (image? x) (string=? (classify-image x) "Square")) 0]
		[(and (image? x) (or (string=? (classify-image x) "Narrow") (string=? (classify-image x) "Very narrow"))) -1]
		[(image? x) 1]
		[(and (boolean? x) x) 1]
		[(boolean? x) 0]
		[(number? x) (sgn2 x)]
		[(and (string? x) (number? (string->number x))) (sgn2 (string->number x))]
		[(string? x) "Couldn't convert string->number"]
		[else "Class not supported"]))

(sgn3 #t)
(sgn3 #f)
(sgn3 45)
(sgn3 -45)
(sgn3 0)
(sgn3 (rectangle 3 3 "solid" "red"))
(sgn3 (rectangle 1 3 "solid" "red"))
(sgn3 (rectangle 2 3 "solid" "red"))
(sgn3 (rectangle 3 1 "solid" "red"))
(sgn3 (rectangle 3 2 "solid" "red"))
(sgn3 "hola")
(sgn3 (cons 1 2))