#lang racket/base

;; Coordinates are reperesented by 2 numbers and the distance is represented by another number
;; distance-to-origin: number number -> number
;; the input is a coordinate and then it will give you the distance between that point in space from the coordinate (0, 0)
;; examples
;; input: 3 4 output: 5
;; input: -3 -4 output: 5
;; input: 4 5 output: 6.4
(define (distance-to-origin x y)
	(sqrt (+ (expt x 2) (expt y 2))))
(distance-to-origin 3 4)
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
;; input: "hello" output: "hell"
;; input: "bye" output: "by"
;; input: "for" output: "fo"
(define (without-the-last-character str)
	(substring str 0 (- (string-length str) 1)))
(without-the-last-character "hello")
(without-the-last-character "bye")
(without-the-last-character "for")