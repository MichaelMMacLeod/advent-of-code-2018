#lang racket

(define input (map symbol->string (file->list "input")))

(define (common-characters str1 str2)
  (for/fold ([common '()]
             #:result (list->string (reverse common)))
            ([c1 (in-string str1)]
             [c2 (in-string str2)])
    (cond [(char=? c1 c2)
           (cons c1 common)]
          [else common])))

(define (most-common-characters str strings)
  (first (sort (map (curry common-characters str)
                    strings)
               length)))

(define (string-length>? a b)
  (> (string-length a) (string-length b)))

(define (longest-string strings)
  (first (sort strings string-length>?)))

(define ((most-common strings) str)
  (for/fold ([longest ""])
            ([check-str (in-list strings)]
             #:unless (string=? str check-str))
    (define common (common-characters str check-str))
    (cond [(> (string-length common) (string-length longest))
           common]
          [else longest])))

(longest-string (map (most-common input) input))