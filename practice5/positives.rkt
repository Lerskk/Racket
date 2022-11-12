#lang racket
(require test-engine/racket-tests)

;; a List-of-positives is:
;; '()
;; (cons PositiveNumber List-of-positives)

(check-expect (positives empty) empty)
(check-expect (positives (list 1 -2 3)) (list 1 3))
(check-expect (positives (list 1 2 3)) (list 1 2 3))
(check-expect (positives (list -1 -2 -3)) empty)

(define (positives list)
	(cond
		[(empty? list) empty]
		[(> (first list) 0) (cons (first list) (positives (rest list)))]
		[else (positives (rest list))]))

(test)