#lang racket

;;; Lista os primos menores que n.

(require quickcheck)

(define (divisivel? a b)
  (= (modulo a b) 0))

(define (possiveis-divisores a)
  (cons 2
    (cdr (build-list (floor (/ a 2))
     (lambda(x) (add1 (* x 2)))))))

(define (primo? n)
  (or (= n 2) (and
   (> n 2)
   (not (ormap
     (lambda (x) (divisivel? n x))
     (possiveis-divisores n))))))

(define prop-primo-infatoravel
  (property
   ([n (choose-integer 2 (random 100000))])
   (==> (primo? n) (not (ormap
     (lambda (x) (divisivel? n x))
     (possiveis-divisores n))))))

(define (primos-ate n)
  (filter primo? (build-list (sub1 n) (lambda (x) (+ 2 x)))))

(define prop-primos-ate
  (property
   ([n (choose-integer 2 (random 10000))])
   (andmap primo? (primos-ate n))))


;;; tests

(quickcheck prop-primos-ate)

