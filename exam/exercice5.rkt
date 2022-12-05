#lang racket
(require test-engine/racket-tests)

(check-expect (replicate (list 1 2) 3) (list 1 1 1 2 2 2))
(check-expect (replicate empty 3) empty)

(define (replicate list n) (repeat list n n))

(define (repeat list n i)
	(cond
		[(empty? list) empty]
		[(not (= i 0)) (cons (first list) (repeat list n (- i 1)))]
		[else (repeat (rest list) n n)]))

(test)