#lang racket
(require test-engine/racket-tests)

;; we represent names with strings 
;; ----------
;; a List-of-contacts is:
;; '()
;; (cons String List-of-contacts)
;; interpretation List-of-contacts represent a a list of names that are contacts

;;; (define-struct Contact [])

;;; (cons "mati" (cons "viky" (cons "juanda" (cons "kev" (cons "fausto" '())))))
;;; (cons "mati" (cons "viky" (cons "juanda" (cons "kev" (cons "fausto" empty)))))
;;; (list "mati" "viky" "juanda" "kev" "fausto")

;; data disgn
;; we represent a names with strings in a list

;; signature and purpouse
;; have-Marcos? : Contacts -> Booleano
;; given a list gives true if "Marcos" is inside the list

;; examples someting
(check-expect (have-Marcos? '()) #false)
(check-expect (have-Marcos? (cons "Sara" (cons "Pedro"  (cons "Esteban" '())))) #false)
(check-expect (have-Marcos? (cons "A" (cons "Marcos" (cons "C" '())))) #true)
(check-expect (have-Marcos? (cons "Juan" '())) #false)
(check-expect (have-Marcos? (cons "Marcos" '())) #true)
(check-expect (have-Marcos? (list 2 "Marcos" "what")) "Invalid data type")
(check-expect (have-Marcos? (cons "Eugenia"
  (cons "Lucía"
    (cons "Dante"
      (cons "Federico"
        (cons "Marcos"
          (cons "Gabina"
            (cons "Sara"
              (cons "Pamela" '()))))))))) #t)

(define (have-Marcos? list) 
	(cond
		[(empty? list) #f]
		[(not (string? (first list))) "Invalid data type"]
		[(string=? "Marcos" (first list)) #t]
		[else (have-Marcos? (rest list))]))

(test)

(have-Marcos? (cons "Marcos" (cons "C" '())))
(have-Marcos? (cons "A" (cons "Marcos" (cons "C" '()))))
