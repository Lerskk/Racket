#lang racket
(require test-engine/racket-tests)

;; a List-of-words is:
;; '()
;; (cons String List-of-words)
 
(check-expect (shorts empty) empty)
(check-expect (shorts (list "something" "long" "short" "by")) (list "long" "by"))
(check-expect (shorts (list "something" "short")) empty)

(define (shorts list)
	(cond
		[(empty? list) empty]
		[(< (string-length (first list)) 5) (cons (first list) (shorts (rest list)))]
		[else (shorts (rest list))]))

(test)