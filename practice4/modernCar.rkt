#lang racket/base

(require 2htdp/image)

(define-struct Car [model age fuel-type autonomy])

(define (fuel-price fuel-type)
	(if (string=? fuel-type "gasoline") 19 17))

(define (calculate multiplier car km-todo)
	(+ (* (/ km-todo 100) 50) (* (/ km-todo (* (Car-autonomy car) multiplier)) (fuel-price (Car-fuel-type car)))))

(define (travel-cost car km-todo)
	(cond
		[(< (Car-age car) 1) (calculate 1 car km-todo)]
		[(< (Car-age car) 6) (calculate 0.98 car km-todo)]
		[(< (Car-age car) 10) (calculate 0.92 car km-todo)]
		[(< (Car-age car) 16) (calculate 0.90 car km-todo)]
		[else (calculate 0.85)]))

(define CAR (make-Car "model" 0 "gasoline" 13))

(travel-cost CAR 30)

