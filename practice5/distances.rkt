#lang racket
(require test-engine/racket-tests)

;; a List-of-Coords is:
;; '()
;; (cons Coords List-of-Coords)

(check-expect (distances empty) empty)
(check-expect (distances (list (make-Coords 3 4) (make-Coords 3 0) (make-Coords 0 3) (make-Coords 0 0))) (list 5 3 3 0))

(define-struct Coords [x y])

(define (distance coord)
	(sqrt (+ (expt (Coords-x coord) 2) (expt (Coords-y coord) 2))))

(define (distances list)
	(cond
		[(empty? list) empty]
		[(cons (distance (first list)) (distances (rest list)))]))

(test)
