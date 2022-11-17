#lang racket
(require test-engine/racket-tests)

;; a list-of-words is:
;; '()
;; (cons String list-of-words)

(check-expect (append-everything (list "I " "am " "a " "list")) "I am a list")
(check-expect (append-everything empty) "")
(check-expect (append-everything (list "I am not a real list")) "I am not a real list")

(define (append-everything list)
	(cond
		[(empty? list) ""]
		[else (string-append (first list) (append-everything (rest list)))]))

(test)