#lang racket
(require test-engine/racket-tests)

;; a List-of-numbers is:
;; '())
;; (cons Number List-of-numbers)

(check-expect (evens empty) empty)
(check-expect (evens (list 1 4 9 3 8)) (list 4 8))
(check-expect (evens (list 2 4 6 8)) (list 2 4 6 8))
(check-expect (evens (list 1 3 5 7 9)) empty)

(define (evens list)
	(cond
		[(empty? list) '()]
		[(even? (first list)) (cons (first list) (evens (rest list)))]
		[else (evens (rest list))]))

(test)

(evens empty)
(evens (list 1 4 9 3 8))
(evens (list 2 4 6 8))
(evens (list 1 3 5 7 9))