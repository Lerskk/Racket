#lang racket/base

(define-struct Student [file name age])

(define STUDENT1 (make-Student 1234 "Fausto" 20))

(Student-file STUDENT1)
(Student-name STUDENT1)
(Student-age STUDENT1)
(Student? (make-Student 1234 "Fausto" 20))
(Student? STUDENT1)
(Student? "I'm a student")