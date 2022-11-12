#lang racket
(require test-engine/racket-tests)

;; a List-of-numbers is:
;; '()
;; (cons Number List-of-numbers)

(check-expect (sign empty) empty)
(check-expect (sign (list 1 30 -10 0 0 -20)) (list 1 1 -1 0 0 -1))

(define (sign list)
	(cond
		[(empty? list) empty]
		[(> (first list) 0) (cons 1 (sign (rest list)))]
		[(= (first list) 0) (cons 0 (sign (rest list)))]
		[else (cons -1 (sign (rest list)))]))

(test)