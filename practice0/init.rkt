#lang racket/base
(require 2htdp/image)

; numbers

;; 12 * 5 - 7 * 6
(- (* 12 5) (* 7 6))

;; 3 * 5 - 7 * 4 / 14 + 3 / 1
(- (* 3 5) (+ (/ (* 7 4) 14) (/ 3 1)))

;; cos(0.8) + 1/5 + sen(0.5) * 3.5
(+ (cos 0.8) (/ 1 5) (* (sin 0.5) 3.5))

; strings
(string-append "Hi" ", " "I'm DrRacket")

(string-length "How long could it be")
(string-append "The string has: " (number->string (string-length (string-append "How long could it be" ". " "And now?"))) " " "characters")
(substring "How is DrRacket doing?" 4 6)
;; (substring "?" 4 6) ERROR: valid range [0, 1]


#| bools
  True is represented by true or #t
  False is represented by false or #f

  There are some operators
    - and p q
    - or p q
    - not p

  Some operators are only available when we are dealing with numbers
    [>, <, =, <=, >=]
|#

(not #t)
(and #t #f)
(and #t #t)
(or #true #f)
(and (not #false))

(= 3 3)
(and (= 3 3) #t)
(and (= 3 3) #false)
(and (= 3 3) (< 3 777))

; images
(circle 20 "solid" "green")

;; creates a shape as product of multiple shapes, the stacking order is left is in front of right
(overlay (rectangle 20 20 "solid" "blue") (circle 7 "solid" "green")) 

;; create an empty scene limeted by the size that you put in. It will be represented by balck lines
(empty-scene 100 100) 

;; put an image on a set of coordinates
(place-image (circle 10 "solid" "blue") 40 80 (empty-scene 100 100)) 

;; mesure the width of an image
(+ (image-width (circle 10 "solid" "red")) (image-height (rectangle 10 20"solid" "blue"))) 

; constant

(define ABC "abc")
(define P "Pluto")
ABC
P

(string-append "abc + pluto: " ABC P)

; functions
(define (f x) (+ x 1))
(* (f 3) (f 2))

(define (duble-me x) (* x 2))
(duble-me 5)
(duble-me (duble-me 10))

(define (duble-me-and-him x y) (string-append (number->string (duble-me x)) " and "(number->string (duble-me y))))
(duble-me-and-him 5 10)

(define (color-the-square size color) (square size "solid" color))
(color-the-square 20 "green")
(overlay (color-the-square 20 "blue") (color-the-square 25 "green") (color-the-square 30 "blue"))

