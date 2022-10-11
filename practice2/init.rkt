#lang racket/base
(require test-engine/racket-tests)

;; Coordinates are reperesented by 2 numbers and the distance is represented by another number
;; distance-to-origin: number number -> number
;; the input is a coordinate and then it will give you the distance between that point in space from the coordinate (0, 0)
;; examples
;; input: 3 4 output: 5
;; input: -3 -4 output: 5
;; input: 4 5 output: 6.4
(define (distance-to-origin x y)
	(sqrt (+ (expt x 2) (expt y 2))))
(distance-to-origin -3 -4)
(distance-to-origin 4 5)

;; coordinates are represented by 2 pairs of 2 numbers and the distance is represented by another number
;; distance-from-point-to-point: number number number number -> number
;; the input is 2 sets of coordinates and then the output will be the distance from the first set of coordinates to the second one
;; examples
;; 3 4 0 0 output: 5
;; 5 6 2 2 output: 5
;; -1 -1 2 3 output: 5
(define (distance-from-point-to-point x y a b)
	(sqrt (+ (expt (- x a) 2) (expt (- y b) 2))))
(distance-from-point-to-point 3 4 0 0)
(distance-from-point-to-point 5 6 2 2)
(distance-from-point-to-point -1 -1 2 3)

;; the dimensions of the cube are represented by a number and the volume is also represented by a number
;; cube-volume: number -> number
;; the input is the edge of the cube and the it will be calculated the volume of the cube doing edeg^3
;; example
;; input: 2 output: 8
;; input: 3 output: 27
;; input: 4 output: 64
(define (cube-volume e)
	(expt e 3))
(cube-volume 2)
(cube-volume 3)
(cube-volume 4)

;; the dimensions of the cube are represented by a number and the area is also represented by a number
;; cube-area: number -> number
;; the input is the edge of the cube and the output will be 6edge^2
;; example
;; input: 2 output: 24
;; input: 3 output: 54
;; input: 4 output: 96
(define (cube-area edge)
	(* (expt edge 2) 6))
(cube-area 2)
(cube-area 3)
(cube-area 4)

;; the funcion will take a word that will be represented as an string and a number that will specify 
;; the position in the string (starting from 0) in which the person wants to introduce the '-' in the new string
;; insert-string: string number -> string
;; examples
;; input: 'hello' 0 output: '-ello'
;; input: 'bye' 1 output: 'b-e'
;; input: 'hello' 2 output: 'he-lo'
(define (insert-string str i)
	(string-append (substring str 0 i) "-" (substring str (+ i 1) (string-length str))))
(insert-string "hello" 0)
(insert-string "bye" 1)
(insert-string "hello" 2)

;; the function will take the string and will return the last leter if string is not ""
;; last-of-string: string -> string
;; examples
;; input: "hello" output: "o"
;; input: "bye" output: "e"
;; input: "" output: "ERROR: input was an empty string"
(define (last-of-string str)
	(cond
		[(= (string-length str) 0) "ERROR: input was an empty string"]
		[else (substring str (- (string-length str) 1))]))
(last-of-string "hello")
(last-of-string "bye")
(last-of-string "")

;; the function will take the string and return a string without the last character
;; without-the-last-character: stirng -> string
;; examples
(check-expect (without-the-last-character "hello") "hell")
(check-expect (without-the-last-character "bye") "by")
(check-expect (without-the-last-character "for") "by")
(define (without-the-last-character str)
	(substring str 0 (- (string-length str) 1)))

;; there are 3 variables to represent, people, how many months they pay and the amount of money that they need to pay. This three are represented by numbers
;; amount-person: number number -> number
;; this will check in which category the combination of people and months fall
;; examples
;;; (check-expect (amount-person 1 1) )
;;; (check-expect (amount-person 1 4) )
;;; (check-expect (amount-person 2 3) )
;;; (check-expect (amount-person 3 1) )

(define MONTHLY-PAYMENT 650)
(define MAX-DISCOUNT 35)
(define TWO-PEOPLE-DISCOUNT 10)
(define THREE-PEOPLE-DISCOUNT 20)
(define TWO-MONTHS-DISCOUNT 15)
(define THREE-MONTHS-DISCOUNT 25)
(define (math discount) (/ (- 100 (+ THREE-MONTHS-DISCOUNT discount)) 100))

(define (evaluate-months months discount)
	(cond 
		[(= months 1) (* MONTHLY-PAYMENT (/ (- 100 discount) 100))] 
		[(= months 2) (* 2 MONTHLY-PAYMENT (/ (- 100 (+ TWO-MONTHS-DISCOUNT discount)) 100))]
		[else (* months MONTHLY-PAYMENT 
				(if (> (math discount) (math MAX-DISCOUNT))
					(/ (- 100 MAX-DISCOUNT) 100)
					(math discount)))]))

(define (amount-person people months)
	(cond 
		[(= people 1) (evaluate-months months 0)]
		[(= people 2) (* 2 (evaluate-months months TWO-PEOPLE-DISCOUNT))]
		[else (* 3 (evaluate-months months THREE-PEOPLE-DISCOUNT))]))

(amount-person 1 1)
(amount-person 1 2)
(amount-person 1 3)
(amount-person 2 1)
(amount-person 2 2)
(amount-person 2 3)
(amount-person 3 1)
(amount-person 3 2)
(amount-person 3 3)

;; data design
;; the age and the amount of hemogoblin are represented by numbers and return a boolean 
;; signature and function purpose
;; anemia?: number number -> boolean
;; will take two numbers and base on the age and hemogoblin will define if you have or have not anemia
;; examples

(define (anemia? age hemogoblin)
	(cond 
		[(<= age 1) (< hemogoblin 13)]
		[(<= age 6) (< hemogoblin 10)]
		[(<= age 12) (< hemogoblin 11)]
		[(<= age 60) (< hemogoblin 11.5)]
		[(<= age 120) (< hemogoblin 12.6)]
		[else (< hemogoblin 13)]))

(anemia? 1 13)
(anemia? 1 10)
(anemia? 3 10)
(anemia? 5 9.9)
(anemia? 6.1 13)
(anemia? 10 10)
(anemia? 54 12)
(anemia? 13 11.3)
(anemia? 115 13)
(anemia? 120 12.5)
(anemia? 121 13)
(anemia? 1150 10)