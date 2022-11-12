#lang racket
(require test-engine/racket-tests)

;; a list-of-words is:
;; '()
;; (cons String list-of-words)

;; a list-of-lengths is:
;; '()
;; (cons Number list-of-lengths)

(check-expect (lengths empty) empty)
(check-expect (lengths (list "")) (list 0))
(check-expect (lengths (list "hi" "bye" "hello")) (list 2 3 5))
(check-expect (lengths (list "hi" "bye" "hello" "" " ")) (list 2 3 5 0 1))

(define (lengths list)
	(cond
		[(empty? list) empty]
		[else (cons (string-length (first list)) (lengths (rest list)))]))

(test)