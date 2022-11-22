#lang racket
(require test-engine/racket-tests)

;; a list-of-words is:
;; '()
;; (cons String list-of-words)

;; data representation
;; words will be represented by data type String

;; signature and function puprose
;; function list-of-words -> Strings
;; fold will append every word on the list and return a string

;; example
(check-expect (foldr string-append "" (list "I " "am " "human")) "I am human")
(check-expect (foldl string-append "" (list "am" "I " "Yoda ")) "Yoda I am")

(test)