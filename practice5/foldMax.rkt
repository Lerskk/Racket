#lang racket
(require test-engine/racket-tests)

;; a list-of-numbers is:
;; '()
;; (cons Number list-of-numbers)

;; data representation
;; numbers will be represented by the data type Number

;; signature and function puprose
;; function Number list-of-numbers -> Number
;; function will check the greates number of the list-of-numbers

;; examples
(check-expect (foldl (lambda (tem-max number) (if (> number tem-max) number tem-max)) 0 (list -1 0 1)) 1)

(test)