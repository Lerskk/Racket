#lang racket
(require test-engine/racket-tests)

;; a list-of-numbers is:
;; '()
;; (cons Number list-of-numbers)

(check-expect (multiply (list 1 2 3 4 5)) 120)
(check-expect (multiply empty) 1)
(check-expect (multiply (list 0 30 2 1)) 0)

(define (multiply list)
	(cond
		[(empty? list) 1]
		[else (* (first list) (multiply (rest list)))]))

(test)