#lang racket
(require test-engine/racket-tests)

;; a list-of-numbers is:
;; '()
;; (cons Number list-of-numbers)

;; a list-of-roots is:
;; '()
;; (cons Number list-of-roots)

;; data representation
;; numbers will be represented by numbers

;; signature and function purpose
;; sqrt list-of-numbers -> list-of-roots
;; you give the map a sqrt function and it will return a list of rooted numbers

;; examples
(check-expect (map sqrt (list 9 4 16)) (list 3 2 4))
(check-expect (map sqrt empty) empty)
(check-expect (map sqrt (list 0)) (list 0))

(test)

