#lang racket
(require test-engine/racket-tests)

;; a list-of-numbers is:
;; '()
;; (cons Number list-of-numbers)

;; a list-of-squares is:
;; '()
;; (cons Number list-of-squares)

;; data representation
;; numbers will be represented by Number

;; signature and function purpose
;; function list-of-numbers -> list-of-squares
;; map will take a function that square every element of the given list 

;; examples
(check-expect (map (lambda (number) (expt number 2)) (list 2 3 4 )) (list 4 9 16))
(check-expect (map (lambda (number) (expt number 2)) (list 0)) (list 0))
(check-expect (map (lambda (number) (expt number 2)) empty) empty)

(test)