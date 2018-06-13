#lang racket
;;; Demo de expressoes booleanas e numericas


;;; boolean values
(if #t 1 2)
(if #t "Verdadeiro" "Falso")
(if #f "Verdadeiro" "Falso")
(if 2 "Verdadeiro" "Falso")
(if "False" "Verdadeiro" "Falso")

;;; boolean functions
(and #t #f)
(or #f #f #t)
(not (xor #t (or #f #f #t)))
(not "lixo")

;;; numerical expressions and type testing
(+ 1 2)
(/ 5 (* 4 (+ 2 1)))
(sqrt -1)
(/ (sqrt -1) 4)
(+ 1.0 2+3i 5)
(complex? (sqrt -1))
(complex? (sqrt 16))
(real? (sqrt -1))
(real? (sqrt 16))
