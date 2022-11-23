#lang racket
(require test-engine/racket-tests)

;; a list-of-numbers is:
;; '()
;; (cons Number list-of-numbers)
;; is a list which his element are defined as Number

;; data representation
;; numbers are represented by numbers

;; signature and function puprose
;; list-of-numbers -> Number
;; takes a list of numbers and returns the addition of their squares

;; examples
(check-expect (foldl (lambda (number result) (+ result (expt number 2))) 0 (list 2 3)) 13)
(check-expect (foldl (lambda (number result) (+ result (expt number 2))) 0 (list -2 -3)) 13)
(check-expect (foldl (lambda (number result) (+ result (expt number 2))) 0 (list 2 -2)) 8)
(check-expect (foldl (lambda (number result) (+ result (expt number 2))) 0 (list 0 0)) 0)
(check-expect (foldl (lambda (number result) (+ result (expt number 2))) 0 empty) 0)

(test)