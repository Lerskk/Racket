#lang racket
(require test-engine/racket-tests)

;; a list-of-numbers is:
;; '()
;; (cons Number list-of-numbers)

;; a list-of-signs is:
;; '()
;; (cons Number list-of-signs)

;; data representation
;; i will represent the numbers as Numbers and the sign as -1 0 1 (Numbers)

;; signature and function purpose
;; function list-of-numbers -> list-of-signs
;; map will take a function and a list-of-numbers then the function will return -1 if the number is negative 0 if it's 0 and 1 if the number is positive

;; examples
(check-expect (map (lambda (number) (cond [(< number 0) -1] [(= number 0) 0] [else 1])) (list -1 -2 0 2 1)) (list -1 -1 0 1 1))
(check-expect (map (lambda (number) (cond [(< number 0) -1] [(= number 0) 0] [else 1])) (list 0 0 0 0 1)) (list 0 0 0 0 1))
(check-expect (map (lambda (number) (cond [(< number 0) -1] [(= number 0) 0] [else 1])) (list -1 -2 -2 1)) (list -1 -1 -1 1))
(check-expect (map (lambda (number) (cond [(< number 0) -1] [(= number 0) 0] [else 1])) (list 1 2 2 1)) (list 1 1 1 1))
(check-expect (map (lambda (number) (cond [(< number 0) -1] [(= number 0) 0] [else 1])) empty) empty)

(test)