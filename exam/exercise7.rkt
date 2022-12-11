#lang racket
(require test-engine/racket-tests)

;; data design
;; a empty-list-of-list is:
;; '()
;; (cons list empty-lits-of-list)

;; signature and function purpose
;; empty-list-of-list -> Bool
;; the function will check if all the list are empty then returns true else returns false

;; example
(check-expect (empty-sublist? (list '() '())) #true)
(check-expect (empty-sublist? (list '() (list 2 4))) #false)

(define (empty-sublist? list) 
  (cond 
    [(empty? list) #true]
    [(empty? (first list)) (and #true (empty-sublist? (rest list)))]
    [else #false]))

(test)

