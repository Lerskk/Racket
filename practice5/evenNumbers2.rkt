#lang racket
(require test-engine/racket-tests)

;; a list-of-numbers is:
;; '()
;; (cons Number list-of-numbers)

(check-expect (make-even empty) empty)
(check-expect (make-even (list 1 2 3 4 5 6 7 8 9)) (list 2 4 6 8))
(check-expect (make-even (list 1 3 5)) empty)

(define (make-even list)
	(cond
		[(empty? list) empty]
		[(even? (first list)) (cons (first list) (make-even (rest list)))]
		[else (make-even (rest list))]))

(test)