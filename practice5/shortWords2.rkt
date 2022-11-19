#lang racket
(require test-engine/racket-tests)

;; a list-of-words is:
;; '()
;; (cons String list-of-words)

(check-expect (make-short empty) empty)
(check-expect (make-short (list "Hi" "I'm long" "Imnot")) (list "Hi" "Imnot"))
(check-expect (make-short (list "I'm long" "Too long" "It's super big" "That's what she said")) empty)

(define (make-short list)
	(cond
		[(empty? list) empty]
		[(<= (string-length (first list)) 5) (cons (first list) (make-short (rest list)))]
		[else (make-short (rest list))]))

(test)
