#lang racket
(require test-engine/racket-tests)

;; a list-of-natural-numbers is:
;; '()
;; (cons Natural-number list-of-natural-numbers)

(check-expect (max (list 2 30 10 1440 0)) 1440)
(check-expect (max (list 0)) 0)
(check-expect (max empty) 0)

(define (max list)
	(cond
		[(empty? list) 0]
		[else (
			if (> (first list) (max (rest list)))
				(first list)
				(max (rest list)))]))

(test)
