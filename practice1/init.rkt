#lang racket/base
(require 2htdp/image)

(define (how-much books) (if (>= books 4)
                           (* (* 60 books) 0.90)
                           (* 60 books)))

(how-much 10)
(how-much 2)
(how-much 3)
(how-much 4)

(define (classify img) (if (> (image-width img) (image-height img))
                         "Ancha"
                         "Angosta"))

(classify  (rectangle 3 4 "solid" "blue"))
(classify (rectangle 4 3 "solid" "blue"))

(define (classify-could-be-square img) 
  (cond 
    [(> (image-width img) (image-height img)) 'Ancha]
    [(< (image-width img) (image-height img)) 'Angosta]
    [else 'Square]))

(classify-could-be-square (rectangle 3 4 "solid" "blue"))
(classify-could-be-square (rectangle 4 3 "solid" "blue"))
(classify-could-be-square (rectangle 4 4 "solid" "blue"))

(define (type-of-triangle a b c) 
  (cond [(= a b c) 'Isosceles]
        [(or (= a b) (= a c) (= b c)) 'Equilateral]
        [else 'Scalen]))



(define (type-of-triangle-not a b c) 
  (cond [(not (= (+ a b c))) 'Non-a-triangle]
        [(= a b c) 'Isosceles]
        [(or (= a b) (= a c) (= b c)) 'Equilateral]
        [else 'Scalen]))

(define BP 60)
(define PP 8)

(define (how-much-more books pens)
  (+ (if (>= books 4) (* books BP 0.9) (* books BP)) (if (>= pens 5) (* pens PP 0.85) (* pens PP))))

(define (how-much-more-more books pens)
  (cond [(>= (+ books pens) 10) (* (+ (* books BP) (* pens PP)) 0.82)]
        [else (+ (if (>= books 4) (* books BP 0.9) (* books BP)) (if (>= pens 5) (* pens PP 0.85) (* pens PP)))]))

(define (how-much-more-more-more books pens)
  (cond [(>= (+ books pens) 10) (+ (* books BP 0.82) (* pens PP 0.82))]
        [else (+ (if (>= books 4) (* books BP 0.9) (* books BP)) (if (>= pens 5) (* pens PP 0.85) (* pens PP)))]))

(how-much-more 3 22)
(how-much-more-more 3 22)
(how-much-more-more-more 3 22)

(define (pythagoras a b) (sqrt (+ (expt a 2) (expt b 2))))

(define (pythagorean-triple a b c) (if (= c (pythagoras a b)) #true #false))
(pythagorean-triple 3 4 5)
(pythagorean-triple 1 2 3)

(define (txt a b c) (string-append "Los numberos " (number->string a) ", " (number->string b) " y " (number->string c) " "))
(define TXT "forman una terna pitagorica")

(define (pythagorean-triple-beauty a b c) (if (= c (pythagoras a b)) (string-append (txt a b c) TXT) (string-append (txt a b c) "no " TXT)))

(pythagorean-triple-beauty 3 4 5)
(pythagorean-triple-beauty 1 2 3)

(define (collatz n) (if (even? n) (/ n 2) (+ (* 3 n) 1)))

(define (collatz-custom n) (if (= (modulo n 2) 0) (/ n 2) (+ (* 3 n) 1)))

(collatz 3)
(collatz 4)

(collatz-custom 3)
(collatz-custom 4)
