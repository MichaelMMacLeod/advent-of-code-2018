#lang racket

(for/fold ([frequency 0]
           [frequencies (set)]
           #:result frequency)
          ([input (in-cycle (call-with-input-file "input" read))]
           #:break (set-member? frequencies frequency))
  (values (+ input frequency)
          (set-add frequencies frequency)))