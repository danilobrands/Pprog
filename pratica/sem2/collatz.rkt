#lang racket

;;; verifica a conjectura de collatz para naturais arbitrarios

(require quickcheck)
(require "paridade.rkt")

(define (collatz-f n)
  (if (par? n)
      (/ n 2)
      (add1 (* 3 n))))

(define (collatz n)
  (if (= 1 n)
      true
      (collatz (collatz-f n))))

;;; tests

(define prop-collatz
  (property ([n arbitrary-natural])
            (collatz (add1 n))))