#lang racket
(require test-engine/racket-tests)

;; data design
;; a list-of-words is:
;; '()
;; (cons String list-of-words)

;; Words is a struct such that shortest: String and longest: String
(define-struct Words [shortest longest])

;; signature and function purpose
;; short-long: list-of-words -> Words 
;; the function will take list of words and return a struct with the shortest and longest words

;; examples
(check-expect (short-long (list "I'm long" "I'm short")) (make-Words "I'm long" "I'm short"))
(check-expect (short-long (list "Isn't that" "toooooo" "Ironic")) (make-Words "Isn't that" "Ironic"))
(check-expect (short-long (list "I'm alone")) (make-Words "I'm alone" "I'm alone"))

(define (shortest list aux)
  (cond
    [(empty? list) aux]
    [(< (string-length (first list)) (string-length aux)) (shortest (rest list) (first list))]
    [else (shortest (rest list) aux)]))

(define (longest list aux)
  (cond
    [(empty? list) aux]
    [(> (string-length (first list)) (string-length aux)) (longest (rest list) (first list))]
    [else (longest (rest list) aux)]))

(define (short-long list) (make-Words (shortest list (first list)) (longest list (first list))))


(test)
