#lang racket

(define-struct Dish [name main desert])
(define-struct Final-dish [first second third forth fifth])

(define (count-first list)
	(cond
		[(empty? list) 0]
		[(= 1 (Dish-main (first list))) (+ 1 (count-first (rest list)))]
		[else (+ 0 (count-first (rest list)))]))


(define (count-second list)
	(cond
		[(empty? list) 0]
		[(= 2 (Dish-main (first list))) (+ 1 (count-second (rest list)))]
		[else (+ 0 (count-second (rest list)))]))

(define (count-third list)
	(cond
		[(empty? list) 0]
		[(= 3 (Dish-main (first list))) (+ 1 (count-third (rest list)))]
		[else (+ 0 (count-third (rest list)))]))

(define (count-forth list)
	(cond
		[(empty? list) 0]
		[(= 1 (Dish-desert (first list))) (+ 1 (count-forth (rest list)))]
		[else (+ 0 (count-forth (rest list)))]))
		
(define (count-fifth list)
	(cond
		[(empty? list) 0]
		[(= 2 (Dish-desert (first list))) (+ 1 (count-fifth (rest list)))]
		[else (+ 0 (count-fifth (rest list)))]))

(define (make-final-dish list)
	(make-Final-dish (count-first list) (count-second list) (count-third list) (count-forth list) (count-fifth list)))

(define FINAL-DISH (make-final-dish (list 
	(make-Dish "something" 1 1)
	(make-Dish "something" 2 2)
	(make-Dish "something" 3 1)
	(make-Dish "something" 1 1)
	(make-Dish "something" 1 2)
	)))

(list (Final-dish-first FINAL-DISH) (Final-dish-second FINAL-DISH) (Final-dish-third FINAL-DISH) (Final-dish-forth FINAL-DISH) (Final-dish-fifth FINAL-DISH))