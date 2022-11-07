#lang racket
(require test-engine/racket-tests)

;; a list-of-words is:
;; '()
;; (cons String list-of-words)
;; ----------
;; data disgn
;; we will take a string and will check if is inside a list of strings

;; signature and purpose
;; member?: list-of-words -> Boolean
;; the purpose of this program is to verify if a given word is or not into a given list of words

;; examples
(check-expect (member? "x" (list "y" "z" "x")) #t)
(check-expect (member? "something" (list "nothing" "anything")) #f)
(check-expect (member? "something" empty) #f)
(check-expect (member? "nothing" (list "nothing" "something")) #t)

(define (member? searching-word list)
	(cond
		[(empty? list) #f]
		[(string=? searching-word (first list)) #t]
		[else (member? searching-word (rest list))]))

(test)