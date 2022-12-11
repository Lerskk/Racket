#lang racket
(require test-engine/racket-tests)

;; data design
;; a list-of-strings is:
;; '()
;; (cons String list-of-strings)

;; signature and function purpose
;; list-of-strings String -> list-of-strings
;; you give a list of strings and the function will return the elemnts that has as substring the given string as second parameter

;; examples
(check-expect (substrings empty "i") empty)
(check-expect (substrings (list "Hi" "Im" "String") "i") (list "Hi" "String"))
(check-expect (substrings (list "Hi" "Im" "String") "m") (list "Im"))
(check-expect (substrings (list "String") "tri") (list "String"))
(check-expect (substrings (list "Hi" "Im" "String") "x") empty)

(define (substrings list string)
  (cond
    [(empty? list) empty]
    [(string-contains? (first list) string) (cons (first list) (substrings (rest list) string))]
    [else (substrings (rest list) string)]))

(test)
