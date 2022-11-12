#lang racket
(require test-engine/racket-tests)

;; a List-of-roots is:
;; '()
;; (cons Number List-of-roots)

(check-expect (roots empty) empty)
(check-expect (roots (list 9 16 4 0)) (list 3 4 2 0))
(check-expect (roots (list 0)) (list 0))

(define (roots list)
	(cond 
		[(empty? list) empty]
		[else (cons (sqrt (first list)) (roots (rest list)))]))

(test)