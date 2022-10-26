#lang racket/base

(require 2htdp/image)
(require 2htdp/universe)

(define-struct Student [name classification attendance])

(define (classify student)
	(cond
		[(not (Student? student)) "Invalid data type"]
		[(< (Student-attendance student) 60) "Free"]
		[(< (Student-classification student) 6) "Free"]
		[(< (Student-classification student) 8) "Regular"]
		[else "Promoted"]))

(classify "hi")
(classify (make-Student "l" 3 30))
(classify (make-Student "l" 3 90))
(classify (make-Student "l" 7 90))
(classify (make-Student "l" 9 90))