#lang racket
(require test-engine/racket-tests)

;; a List-of-numbers is:
;; '()
;; (cons Number List-of-numbers)

(check-expect (positive? empty) #f)
(check-expect (positive? (list 2 3 9 10 -10)) #f)
(check-expect (positive? (list 2 3 9 -10 10)) #f)
(check-expect (positive? (list 2 3 9 10 10)) #t)
(check-expect (positive? (list 1)) #t)

(define (positive? list)
	(cond
		[(empty? list) #false]
		[(empty? (rest list)) (> (first list) 0)]
		[else (and (> (first list) 0) (positive? (rest list)))]))

(check-expect (check-add empty) 0)
(check-expect (check-add (list 2 3 9 -10 10)) "Error, not a stack of money")
(check-expect (check-add (list 2 3 9 10 10)) 34)
(check-expect (check-add (list 1)) 1)

(define (map-add stack)
	(cond
		[(empty? stack) 0]
		[else (+ (first stack) (map-add (rest stack)))]))

(define (check-add list)
	(cond
		[(empty? list) 0]
		[(positive? list) (map-add list)]
		[else "Error, not a stack of money"]))

(test)
