#lang racket
(require test-engine/racket-tests)

;; a list-of-numbers is:
;; '()
;; (cons Number list-of-numbers)

;; data representation
;; use the numbers as Numbers	

;; signature and function purpose
;; function list-of-numbers -> list-of-positive-numbers
;; the function will take an element, check if is positive and return true if it is. filter will add the element to a list

(check-expect (filter positive? empty) empty)
(check-expect (filter positive? (list -1 -2 0 1 2)) (list 1 2))
(check-expect (filter positive? (list 0)) empty)
(check-expect (filter positive? (list -1 -2)) empty)

(test)