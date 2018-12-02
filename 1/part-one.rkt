#lang racket

(apply + (call-with-input-file "input" read))