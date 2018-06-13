#lang racket

;;; verifica a conjectura de collatz para naturais arbitrarios

(define (collatz-f n)
  (if (par? n)
      (/ n 2)
      (add1 (* 3 n))))

(define (collatz n)
  (if (= 1 n)
      true
      (collatz (collatz-f n))))

;;; tests (com gerador customizado)
(define prop-collatz2
  (property ([n (choose-integer 1 100000)])
            (collatz (add1 n))))