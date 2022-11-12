#lang racket
(require test-engine/racket-tests)

;; a list-of-numbers is:
;; '()
;; (cons Number list-of-numbers)

(check-expect (square empty) empty)
(check-expect (square (list 1 2 3)) (list 1 4 9))
(check-expect (square (list -1 -2 -3)) (list 1 4 9))
(check-expect (square (list 0 0 0)) (list 0 0 0))

(define (square list)
	(cond
		[(empty? list) empty]
		[else (cons (expt (first list) 2) (square (rest list)))]))

(test)