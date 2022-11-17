#lang racket
(require test-engine/racket-tests)

;; a list-of-numbers is;
;; '()
;; (cons Number list-of-numbers)

(check-expect (addSquared (list 1 2 3)) 14)
(check-expect (addSquared (list 2 2 2)) 12)
(check-expect (addSquared (list 2 2 2 0)) 12)
(check-expect (addSquared empty) 0)

(define (addSquared list)
	(cond
		[(empty? list) 0]
		[else (+ (expt (first list) 2) (addSquared (rest list)))]))

(test)