#lang racket

(define input (map symbol->string (file->list "input")))

(define (count-each-character str)
  (for/fold ([characters (hash)])
            ([character (in-string str)])
    (hash-set characters character (+ 1 (hash-ref characters character 0)))))

(define (exactly-n-of-any-character? n str)
  (define count (count-each-character str))
  (for/fold ([exists? #f])
            ([(_ occurrences) (in-hash count)])
    (or exists? (= n occurrences))))

(define (false? v)
  (if v #t #f))

(* (length (filter false?
                   (map (curry exactly-n-of-any-character? 2)
                        input)))
   (length (filter false?
                   (map (curry exactly-n-of-any-character? 3)
                        input))))