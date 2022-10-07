#lang racket/base
(require 2htdp/image)

(define peru (place-image (rectangle 30 90 "solid" "red")
                             15 45
                            (place-image (rectangle 30 90 "solid" "red") 75 45(empty-scene 90 60))))
peru

(define italy (place-image (rectangle 30 60 "solid" "green")
                            15 30
                            (place-image (rectangle 30 60 "solid" "red") 75 30 (rectangle 90 60 "solid" "white"))))
italy

(define italy-custom (beside (rectangle 30 60 "solid" "green") (rectangle 30 60 "solid" "white") (rectangle 30 60 "solid" "red")))
italy-custom

(define germany (place-image (rectangle 90 20 "solid" "yellow") 45  50
                              (place-image (rectangle 90 20 "solid" "red") 45 30 (rectangle 90 60 "solid" "black"))))
germany

(define germany-custom (above (rectangle 90 20 "solid" "black") (rectangle 90 20 "solid" "red") (rectangle 90 20 "solid" "yellow")))
germany-custom

(define netherlands (place-image (rectangle 90 20 "solid" "blue") 45 50
                                  (place-image (rectangle 90 20 "solid" "white") 45 30 (rectangle 90 60 "solid" "red"))))
netherlands

(define netherlands-custom (above (rectangle 90 20 "solid" "red") (rectangle 90 20 "solid" "white") (rectangle 90 20 "solid" "blue"))) 
netherlands-custom

(define (stripes->flag top-color middle-color bottom-color) 
  (place-image (rectangle 90 20 "solid" bottom-color) 45 50
               (place-image (rectangle 90 20 "solid" middle-color) 45 30 (rectangle 90 60 "solid" top-color))))
(stripes->flag "green" "red" "blue")

(define (custom-vertical-rectangle color) 
  (rectangle 30 60 "solid" color))

(define (colors->flags first-color second-color third-color orientation)
  (cond 
    [(string=? (string-downcase orientation) "horizontal") (stripes->flag first-color second-color third-color)]
    [(string=? (string-downcase orientation) "vertical") (beside (custom-vertical-rectangle first-color) (custom-vertical-rectangle second-color) (custom-vertical-rectangle third-color))]))
(colors->flags "blue" "red" "green" "horizontal")
(colors->flags "green" "white" "red" "vertical")
(colors->flags "blue" "white" "red" "vertical")

(define sudan 
  (place-image (rotate -90 (triangle 60 "solid" "green")) (/ 45 2) 30 (colors->flags "red" "white" "black" "HORIZONTAL"))) 
sudan

(define argentina
  (overlay (circle 7 "solid" "yellow") (colors->flags "blue" "white" "blue" "horizontal")))
argentina

(define cameroon
  (overlay (star 7 "solid" "yellow") (colors->flags "green" "red" "yellow" "vertical")))
cameroon

(define brazil
  (overlay (circle 10 "solid" "blue") (rhombus 40 120 "solid" "yellow") (rectangle 90 60 "solid" "green")))
brazil
