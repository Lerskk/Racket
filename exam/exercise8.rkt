#lang racket
(require test-engine/rackte-tests)

;; data design
;; struct 'Worker' with surname: String, status: engaged | alone, amount-of-childrens: Number, salary: Number

(define-struct Worker [surname status amount-of-childrens salary])

;; signature and function purpose
;; Worker -> Number
;; It will take a Worker and return the taxes that the worker has to pay

;; exampels
(check-expect (tax "Not a worker") "Invalid data type")
(check-expect (tax (make-Worker Something alone 2 3000)) 3000)

(define (tax worker)
  (cond
    [(not (Worker? worker)) "Invalid data type"]
    [(and (string=? (Worker-status worker) alone)) (< (Worker-salary worker) 15000) (Worker-salary worker)]
    [(and (string=? (Worker-status worker) engaged) (< (Worker-salary worker) 18000)) (Worker-salary worker)]
    [(= (Worker-amount-of-childrens worker) 1) (if (string=? (Worker-status worker) alone)
                                                  ]))
-- TODO

