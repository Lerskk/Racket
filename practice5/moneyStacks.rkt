#lang racket
(require test-engine/racket-tests)

;; a list of List-money-stacks is:
;; '()
;; (cons PositiveNumber List-mokey-stacks)
;; examples
;; (cons 2 (cons 10 (cons 30(cons 1000 '()))))
;; (cons 1000 '())

(check-expect (map-add (cons 2 (cons 10 (cons 30 (cons 1000 '()))))) 1042)
(check-expect (map-add (cons 1000 '())) 1000)
(check-expect (map-add '()) 0)

(define (map-add stack)
	(cond
		[(empty? stack) 0]
		[else (+ (first stack) (map-add (rest stack)))]))

(test)