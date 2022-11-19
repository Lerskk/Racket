#lang racket
(require test-engine/racket-tests)

;; a list-of-numbers is:
;; '()
;; (cons Number list-of-numbers)

(check-expect (filter-n (list 1 2 3 4) 2) (list 1 3 4))
(check-expect (filter-n empty 2) empty)
(check-expect (filter-n (list 2 2 2 2) 2) empty)
(check-expect (filter-n (list 1 2 3 4) 5) (list 1 2 3 4))

(define (filter-n list n)
	(cond
		[(empty? list) empty]
		[(= (first list) n) (filter-n (rest list) n)]
		[else (cons (first list) (filter-n (rest list) n))]))

(test)