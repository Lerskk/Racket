#lang racket
(require test-engine/racket-tests)

;; a List-without-n is:
;; '()
;; (cons Number List-without-n)

(check-expect (filter-n empty 2) empty)
(check-expect (filter-n (list 1 2 3) 2) (list 1 3))
(check-expect (filter-n (list 1 -2 3) 2) (list 1 -2 3))
(check-expect (filter-n (list 0 0 0 0) 0) empty)

(define (filter-n list n)
	(cond
		[(empty? list) empty]
		[(not (= (first list) n)) (cons (first list) (filter-n (rest list) n))]
		[else (filter-n (rest list) n)]))

(test)