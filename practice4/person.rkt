#lang racket/base

(define-struct Person [name weigth weigth-unit height height-unit])

(define (weigth-multiplier unit)
	(cond
		[(not (string? unit)) "Invalid weigth-unit type"]
		[(string=? unit "kg") 1]
		[(string=? unit "g") 0.001]))

(define (weigth person)
	(* (Person-weigth person) (weigth-multiplier (Person-weigth-unit person))))

(define (height-multiplier unit)
	(cond
		 [(not (string? unit)) "Invalid height-unit type"]
		 [(string=? unit "m") 1]
		 [(string=? unit "cm") 0.01]))

(define (height person)
	(expt (* (Person-height person) (height-multiplier (Person-height-unit person))) 2))


(define (bmi person) 
	(/ (weigth person) (height person)))

(bmi (make-Person "Fausto Leoni" 60 "kg" 175 "cm"))
(bmi (make-Person "Fausto Leoni" 60 "kg" 1.75 "m"))
(bmi (make-Person "Fausto Leoni" 60000 "g" 175 "cm"))
(bmi (make-Person "Fausto Leoni" 60000 "g" 1.75 "m"))