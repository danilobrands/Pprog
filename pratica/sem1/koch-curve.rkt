#lang racket

(require 2htdp/image)

(define (koch-curve n)
    (cond
      [(zero? n) (square 1 "solid" "black")]
      [else
       (local [(define smaller (koch-curve (- n 1)))]
         (beside/align "bottom"
                       smaller
                       (rotate 60 smaller)
                       (rotate -60 smaller)
                       smaller))]))
(koch-curve 5)