#lang racket
(require test-engine/racket-tests)
(require 2htdp/image)

;; a List-of-images is:
;; '()
;; (cons image List-of-images)

(check-expect (widths empty) empty)
(check-expect (widths (list (circle 30 "solid" "red") (rectangle 10 30 "outline" "blue") (circle 0 "solid" "green"))) (list 60 10 0))

(define (widths list)
	(cond
		[(empty? list) empty]
		[else (cons (image-width (first list)) (widths (rest list)))]))

(test)