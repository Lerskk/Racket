#lang racket
(require test-engine/racket-tests)

;; a list-of-points is:
;; '()
;; (cons Coord list-of-points)

(define-struct Coord [x y])

(check-expect (add-distances (list (make-Coord 3 4) (make-Coord 0 4) (make-Coord 12 5))) 22)
(check-expect (add-distances (list (make-Coord 3 4) (make-Coord 0 4) (make-Coord 12 5) (make-Coord 0 0))) 22)
(check-expect (add-distances empty) 0)

(define (distance-to-origin coord)
	(sqrt (+ (expt (Coord-x coord) 2) (expt (Coord-y coord) 2))))

(define (add-distances list)
	(cond
		[(empty? list) 0]
		[else (+ (distance-to-origin (first list)) (add-distances (rest list)))]))

(test)