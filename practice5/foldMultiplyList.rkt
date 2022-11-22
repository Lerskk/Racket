#lang racket
(require test-engine/racket-tests)

;; a list-of-numbers is:
;; '()
;; (cons Number list-of-numbers)

;; data representation
;; numbers will be represented by the data type Number

;; signature and function purpose
;; procedure Number list-of-numbers -> Number
;; fold will multiply every element of the list and then return it

;; exmaples
(check-expect (foldl * 1 (list 1 2 3 4 5)) 120)
(check-expect (foldr * 1 (list 2 2)) 4)
(check-expect (foldl * 0 empty) 0)

(test)
