#lang racket
(require test-engine/racket-tests)

;; a List-of-pos is:
;; '()
;; (cons Pos List-of-pos)

(define-struct Pos [x y])

(define MAX (make-Pos 3 3))


(check-expect (tests (close empty)) empty)
(check-expect (tests (close (list (make-Pos 1 2) (make-Pos 3 3) (make-Pos 1 5)))) (list 1 2))
(check-expect (tests (close (list (make-Pos 1 2) (make-Pos 5 5) (make-Pos 5 5)))) (list 1 2))
(check-expect (tests (close (list (make-Pos 9 2) (make-Pos 3 3) (make-Pos 1 5)))) empty)

(define (close list)
	(cond
		[(empty? list) empty]
		[(and (< (Pos-x (first list)) (Pos-x MAX)) (< (Pos-y (first list)) (Pos-y MAX))) (cons (first list) (close (rest list)))]
		[else (close (rest list))]))


(define (tests list)
	(cond
		[(empty? list) empty]
		[else (cons (Pos-x (first list)) (cons (Pos-y (first list)) (tests (rest list))))]))

(test)