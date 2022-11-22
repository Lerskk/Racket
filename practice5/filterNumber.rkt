#lang racket
(require test-engine/racket-tests)

;; a list-of-numbers is:
;; '()
;; (cons Number list-of-numbers)

;; data representation
;; you take numbers and represent them as Numbers

;; signature and function purpose
;; function list-of-numbers n -> list-of-numbers-without-n
;; you take a list of numbers and a number and then return the list without n

(check-expect (filter (lambda (number) (not (= number 2))) (list 1 2 3 4 5 2)) (list 1 3 4 5))
(check-expect (filter (lambda (number) (not (= number 2))) (list 2)) empty)
(check-expect (filter (lambda (number) (not (= number 2))) empty) empty)

(test)
