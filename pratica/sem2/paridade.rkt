#lang racket

;;; Predicado de paridade e respectivo teste via propriedade

(require quickcheck)

(define (par? n)
  (= (modulo n 2) 0))

(define (impar? n)
  (= (remainder n 2) 1))

;;; tests

(define prop-alternancia-par-impar
  (property ([n arbitrary-integer])
            (xor (par? n) (par? (add1 n)))))

(define prop-se-impar-nao-par
  (property ([n arbitrary-integer])
            (==> (par? n) (not (impar? n)))))

(quickcheck prop-alternancia-par-impar)
(quickcheck prop-se-impar-nao-par)