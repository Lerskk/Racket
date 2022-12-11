#lang racket
(require test-engine/racket-tests)

;; data design
;; Person is a struct such that weight: Number, height: Number
(define-struct Person (weight height))
;; a list-of-people is:
;; '()
;; (cons Person list-of-people)

;; classify
;; a list-of-classified is:
;; '()
;; (cons String list-of-classified)



;; signature and function purpose
;; average-imc
;; average-imc: list-of-people -> Number
;; you give a list of people and then returns the average imc

;; classify
;; classify: list-of-people -> list-of-classified
;; you give a list of people and the function returns names of the classification people got into

;; healthy?
;; healthy? list-of-people -> bool
;; you give a list of people and return true if at least 80% of the people have "Normal weight" false otherwise

;; examples
(check-within (average-imc (list (make-Person 44 1.55) (make-Person 50 1.56))) 19.43 0.01)
(check-expect (classify (list (make-Person 44 1.55) (make-Person 50 1.56))) (list "Under weight" "Normal weight"))
(check-expect (healthy? (list (make-Person 44 1.55) (make-Person 50 1.56) (make-Person 50 1.56) (make-Person 50 1.56))) #false)
(check-expect (healthy? (list (make-Person 50 1.55) (make-Person 50 1.56) (make-Person 50 1.56) (make-Person 50 1.56))) #true)

;; (define (add-people-weight list)
;;   (cond
;;     [(empty? list) 0]
;;     [else (+ (Person-weight (first list)) (rest list))]))

(define (person-imc-list person result) (+ result (/ (Person-weight person) (expt (Person-height person) 2))))
(define (amount person result) (+ result 1))

(define (average-imc list) (/ (foldl person-imc-list 0 list) (foldl amount 0 list)))


(define (person-imc person) (/ (Person-weight person) (expt (Person-height person) 2)))

(define (classify list) 
  (cond
    [(empty? list) empty]
    [(< (person-imc (first list)) 18.5) (cons "Under weight" (classify (rest list)))]
    [(< (person-imc (first list)) 25) (cons "Normal weight" (classify (rest list)))]
    [(< (person-imc (first list)) 30) (cons "Over weight" (classify (rest list)))]
    [else (cons "Obesity" (classify (rest list)))]))

;; normal-weight: list-of-people -> Number
;; count if is normal
(define (normal-weight person result) (if (string=? (first (classify (cons person '()))) "Normal weight")
                                      (+ result 1)
                                      (+ result 0)))
                                      

;; list-of-people Number -> Number
(define (percentage list number) (/ (* 100 number) (foldl amount 0 list)))

(define (healthy? list) (> (percentage list (foldl normal-weight 0 list)) 80))


(test)
