#lang racket
(require test-engine/racket-tests)

;; a list-of-numbers is:
;; '()
;; (cons Number list-of-numbers)

(check-expect (make-positives (list -1 -2 0 1 2)) (list 1 2))
(check-expect (make-positives empty) empty)
(check-expect (make-positives (list -1 -2)) empty)

(define (make-positives list)
	(cond 
		[(empty? list) empty]
		[(> (first list) 0) (cons (first list) (make-positives (rest list)))]
		[else (make-positives (rest list))]))

(test)