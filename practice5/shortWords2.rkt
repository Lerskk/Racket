#lang racket
(require test-engine/racket-tests)

;; a list-of-words is:
;; '()
;; (cons String list-of-words)

;; a list-of-short-words is:
;; '()
;; (cons String list-of-short-words)

;; data representation
;; words will be represented by Strings

;; signature and function prupose
;; function list -> list
;; you will take a function that will filter check if the word is shorter than 5 characters and it will add it to a new list

;; examples
(check-expect (filter (lambda (element) (< (string-length element) 5)) (list "hi" "I'm long" "bye")) (list "hi" "bye"))
(check-expect (filter (lambda (element) (< (string-length element) 5)) empty) empty)
(check-expect (filter (lambda (element) (< (string-length element) 5)) (list "I'm too long")) empty)

(test)