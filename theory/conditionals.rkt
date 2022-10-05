#lang racket/base 

(if (= 42 (* 6 7))
  'hi-imtrue
  'false-result) 
(* 6 7)

(if (= 42 (* 6 7))
  (let ()
    'true-result
    "foo"
    42)
  'false-result) ; correct form

(define (h x)
  (cond [(= x 0) 0]
        [(even? x) (+ x 1)]
        [else (- x 1)]))

(h 0)
(h 2)
(h 5)

