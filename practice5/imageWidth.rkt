#lang racket
(require test-engine/racket-tests)
(require 2htdp/image)

;; a list-of-images is:
;; '()
;; (cons Image list-of-images)

;; data representation
;; you represent image as functions such as square, retctangle, circle, etc.

;; signature and function purpose
;; function list-of-images -> list-of-widths
;; you give a function and a list of images to a map, the function check the width of the images and then map return a list with the widths

;; examples
(check-expect (map image-width (list (rectangle 3 40 "solid" "red") (circle 30 "solid" "blue") (square 30 "solid" "green"))) (list 3 60 30))
(check-expect (map image-width empty) empty)

(test)
