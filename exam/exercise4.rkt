#lang racket
(require test-engine/racket-tests)
(require 2htdp/image)

(check-expect (f 2 "Test" #true (rectangle 30 40 "solid" "red")) 32)

(define (f a b c d)
	(+ (- 3 a) (if c 1 (string-length b)) (image-width d)))

(f 2 "Test" #true (rectangle 30 40 "solid" "red"))

(check-expect (g 4 "NotTest" 5) "Error")

(define (g x y z)
	(if (> x (string-length y))
		(if (> 3 z) (+ x 24) 13)
		(if (= (string-length y) 4) z "Error")))

(test)
