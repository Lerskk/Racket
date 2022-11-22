#lang racket
(require test-engine/racket-tests)

;; a list-of-numbers is:
;; '()
;; (cons Number list-of-numbers)

;; a list-of-even-numbers is:
;; '()
;; (cons even-number list-of-even-numbers)

;; data representation
;; we use numbers to define the even numbers

;; signature and function purpose 
;; pred list-of-numbers -> list-of-even-numbers
;; you give a function that returns a boolean and it will evaluate the list until it has check every element and return a new list with the results true

;; examples
(check-expect (filter even? empty) empty)
(check-expect (filter even? (list 1 2 3 4)) (list 2 4))
(check-expect (filter even? (list 1 3 )) empty)

(test)

