#lang racket

;;; Fatorial: tentativa 1

(require quickcheck)

(define (fatorial n)
  (if (= n 0)
      1
      (* n (fatorial (sub1 n)))))

;;; test

(define fatorial-n-fatorial-n+1
  (property ([n arbitrary-natural])
            (= (* (add1 n) (fatorial n)) (fatorial (add1 n)))))

(quickcheck fatorial-n-fatorial-n+1)