#lang racket/base

(define-struct Student [file name age])

(define STUDENT1 (make-Student 1234 "Fausto" 20))

(Student-file STUDENT1)
(Student-name STUDENT1)
(Student-age STUDENT1)
(Student? (make-Student 1234 "Fausto" 20))
(Student? STUDENT1)
(Student? "I'm a student")

(define-struct posn [x y])
(define P (make-posn 3 4))
(define Q (make-posn -2 0.5))

(posn-x P)
(- (posn-y P) (posn-y Q))
(posn-y (make-posn (posn-x P) (posn-x Q)))

(define (distance-to-origin coord)
	(sqrt (+ (expt (posn-x coord) 2) (expt (posn-y coord) 2))))

(distance-to-origin (make-posn (/ 6 2) 4))
(+ (distance-to-origin (make-posn 12 5)) 4)

(define (simetry coord)
	(make-posn (- (posn-x coord)) (- (posn-y coord))))

(simetry (make-posn 3 4))
(simetry (make-posn -2 4))

(define (distance-between-points first-coord second-coord)
	(cond
		[(or (not (posn? first-coord)) (not (posn? second-coord))) "Invalid coordinates"]
		[else (sqrt (+ (expt (- (posn-x first-coord) (posn-x second-coord)) 2) (expt (- (posn-y first-coord) (posn-y second-coord)) 2)))]))
	
(distance-between-points (make-posn 3 4) (make-posn 4 5))

