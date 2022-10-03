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


#| Bools
  True is represented by #true or #t
  False is represented by #false or #f

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
