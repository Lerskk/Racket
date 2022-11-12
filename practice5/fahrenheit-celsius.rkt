#lang racket
(require test-engine/racket-tests)

;; a list-of-temperatures is:
;; '()
;; (cons Number list-of-temperatures)


(define (calculate temperature)
	(* (- temperature 32) (/ 5 9)))

(define (fahrenheit->celsius list)
	(cond
		[(empty? list) empty]
		[else (cons (calculate (first list)) (fahrenheit->celsius (rest list)))]))

(fahrenheit->celsius empty)
(fahrenheit->celsius (list 0))
(fahrenheit->celsius (list 1 2 40 60))
(fahrenheit->celsius (list 1 2 40 60 0))