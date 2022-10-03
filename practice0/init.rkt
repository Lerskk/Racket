#lang racket/base

#; Numbers

#;; 12 * 5 - 7 * 6
(- (* 12 5) (* 7 6))

#;; 3 * 5 - 7 * 4 / 14 + 3 / 1
(- (* 3 5) (+ (/ (* 7 4) 14) (/ 3 1)))

#;; cos(0.8) + 1/5 + sen(0.5) * 3.5
(+ (cos 0.8) (/ 1 5) (* (sin 0.5) 3.5))

#; Strings
(string-append "Hi" ", " "I'm DrRacket")

(string-length "How long could it be")
(string-append "The string has: " (number->string (string-length (string-append "How long could it be" ". " "And now?"))) " " "characters")
(substring "How is DrRacket doing?" 4 6)
#;; (substring "?" 4 6) ERROR: valid range [0, 1]

